import 'package:coinbase_dart/src/coinbase_enums.dart';
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

  void connect() {
    _channel = WebSocketChannel.connect(Uri.parse(webSocketAuthority));
  }

  Future<void> close() async {
    await _channel?.sink.close();
  }

  Stream<Map>? subscribe({
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
    return _channel?.stream.asBroadcastStream().map((event) => jsonDecode(event));
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
    channels: [CoinbaseChannel.level2],
  );
  int i = 0;
  stream?.listen((event) {
    if (i <= 10) {
      _logger.i(event);
      i++;
    } else {
      coinbaseWebsocketClient.close();
    }
  });
}

