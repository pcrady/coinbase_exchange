import 'package:coinbase_dart/coinbase_dart.dart';
import 'package:coinbase_dart/src/lib/coinbase_enums.dart';
import 'package:coinbase_dart/src/models/channels.dart';
import 'package:coinbase_dart/src/models/heartbeat.dart';
import 'package:coinbase_dart/src/models/l2update.dart';
import 'package:coinbase_dart/src/models/snapshot.dart';
import 'package:coinbase_dart/src/models/status.dart';
import 'package:coinbase_dart/src/models/stream_ticker.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:logger/logger.dart';
import 'dart:convert';

class CoinbaseWebsocketClient {
  static const String webSocketAuthority = 'wss://ws-feed.pro.coinbase.com';
  static const String sandboxWebSocketAuthority = 'wss://ws-feed-public.sandbox.pro.coinbase.com';
  final bool sandbox;
  WebSocketChannel? _channel;

  CoinbaseWebsocketClient({
    this.sandbox = false,
  });

  String _buildRequest({
    String? type,
    Map<CoinbaseChannel, List<String>?>? channelProductIdMap,
    List<CoinbaseChannel>? channels,
    List<String>? productIds,
  }) {
    Map request = {
      'type': type,
      'channels': [],
    };

    if (channels != null) request['channels'] = channels.map((channel) => channel.channel()).toList();
    if (productIds != null) request['product_ids'] = productIds;
    if (channelProductIdMap != null) {
      List<Map<String, dynamic>> channelMapping = [];

      channelProductIdMap.forEach((channel, productIds) {
        channelMapping.add({
          'name': channel.channel(),
          'product_ids': productIds,
        });
      });

      request['channels'] = [
        ...request['channels'],
        ...channelMapping,
      ];
    }

    return json.encode(request);
  }

  //TODO make events a subclass of Event or whatever
  //TODO Impliments type and tojson and fromJson
  dynamic _sortEvent(Map<String, dynamic> event) {
    String? type = event['type'];
    if (type == 'heartbeat') {
      return Heartbeat.fromJson(event);
    } else if (type == 'status') {
      return Status.fromJson(event);
    } else if (type == 'ticker') {
      return StreamTicker.fromJson(event);
    } else if (type == 'snapshot') {
      return Snapshot.fromJson(event);
    } else if (type == 'l2update') {
      return L2update.fromJson(event);
    } else if (type == 'received') {
    } else if (type == 'open') {
    } else if (type == 'done') {
    } else if (type == 'match') {
    } else if (type == 'change') {
    } else if (type == 'activate') {
    } else if (type == 'subscriptions') {
      return Subscriptions.fromJson(event);
    } else if (type == 'error') {
      return event['message'];
    } else {
      return event;
    }
  }

  void connect() {
    _channel = WebSocketChannel.connect(Uri.parse(sandbox ? sandboxWebSocketAuthority : webSocketAuthority));
  }

  Future<void> close() async {
    await _channel?.sink.close();
  }

  Stream<dynamic>? subscribe({
    List<CoinbaseChannel>? channels,
    List<String>? productIds,
    Map<CoinbaseChannel, List<String>?>? channelProductIdMap,
  }) {
    String request = _buildRequest(
      type: 'subscribe',
      channels: channels,
      productIds: productIds,
      channelProductIdMap: channelProductIdMap,
    );
    _channel?.sink.add(request);
    return _channel?.stream.asBroadcastStream().map((event) => jsonDecode(event)).map((event) => _sortEvent(event));
  }
}

void main() {
  Logger _logger = Logger(
    printer: PrettyPrinter(methodCount: 0),
  );
  var coinbaseWebsocketClient = CoinbaseWebsocketClient();
  coinbaseWebsocketClient.connect();
  var stream = coinbaseWebsocketClient.subscribe(
    productIds: ['ETH-USD'],
    channels: [
      CoinbaseChannel.heartBeat,
      //CoinbaseChannel.status,
      //CoinbaseChannel.ticker,
      //CoinbaseChannel.level2,
    ],
  );
  int i = 0;
  stream?.listen((event) {
    if (i <= 30) {
      _logger.i(event.toJson());
      i++;
    } else {
      coinbaseWebsocketClient.close();
    }
  });
}
