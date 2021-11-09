import 'package:coinbase_exchange/coinbase_exchange.dart';
import 'package:coinbase_exchange/src/lib/websocket_response.dart';
import 'package:coinbase_exchange/src/models/auction.dart';
import 'package:coinbase_exchange/src/models/websocket_error.dart';
import '../lib/coinbase_enums.dart';
import '../models/activate.dart';
import '../models/change.dart';
import '../models/subscriptions.dart';
import '../models/done.dart';
import '../models/heartbeat.dart';
import '../models/l2update.dart';
import '../models/match.dart';
import '../models/open.dart';
import '../models/received.dart';
import '../models/snapshot.dart';
import '../models/status.dart';
import '../models/stream_ticker.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'dart:convert';

/// A client to connect to the coinbase exchange websocket feed.
class WebsocketClient {
  static const String webSocketAuthority = 'wss://ws-feed.pro.coinbase.com';
  static const String sandboxWebSocketAuthority =
      'wss://ws-feed-public.sandbox.pro.coinbase.com';
  final bool sandbox;
  WebSocketChannel? _channel;

  WebsocketClient({
    this.sandbox = false,
  });

  String get _authority =>
      sandbox ? sandboxWebSocketAuthority : webSocketAuthority;

  String _buildRequest({
    String? type,
    Map<ChannelEnum, List<String>?>? channelProductIdMap,
    List<ChannelEnum>? channels,
    List<String>? productIds,
  }) {
    Map request = {
      'type': type,
      'channels': [],
    };

    if (channels != null)
      request['channels'] =
          channels.map((channel) => channel.channel()).toList();
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

  WebsocketResponse _sortEvent(Map<String, dynamic> event) {
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
      return Received.fromJson(event);
    } else if (type == 'open') {
      return Open.fromJson(event);
    } else if (type == 'done') {
      return Done.fromJson(event);
    } else if (type == 'match') {
      return Match.fromJson(event);
    } else if (type == 'change') {
      return Change.fromJson(event);
    } else if (type == 'activate') {
      return Activate.fromJson(event);
    } else if (type == 'subscriptions') {
      return Subscriptions.fromJson(event);
    } else if (type == 'auction') {
      return Auction.fromJson(event);
    } else if (type == 'error') {
      return WebsocketError(message: event['message'].toString());
    } else {
      throw Exception('An unknown event has occurred: ${event.toString()}');
    }
  }

  /// Connect to a channel.
  void connect() {
    _channel = WebSocketChannel.connect(Uri.parse(_authority));
  }

  /// Close a connection to a channel.
  Future<void> close() async {
    if (_channel != null) {
      await _channel!.sink.close();
    }
  }

  Stream<WebsocketResponse> _manageSubscriptions({
    required ActionEnum action,
    List<ChannelEnum>? channels,
    List<String>? productIds,
    Map<ChannelEnum, List<String>?>? channelProductIdMap,
  }) {
    String request = _buildRequest(
      type: action == ActionEnum.subscribe ? 'subscribe' : 'unsubscribe',
      channels: channels,
      productIds: productIds,
      channelProductIdMap: channelProductIdMap,
    );
    _channel!.sink.add(request);
    return _channel!.stream
        .map((event) => jsonDecode(event))
        .map((event) => _sortEvent(event));
  }

  /// Subscribe to specific channels.
  Stream<WebsocketResponse> subscribe({
    List<ChannelEnum>? channels,
    List<String>? productIds,
    Map<ChannelEnum, List<String>?>? channelProductIdMap,
  }) {
    if (_channel == null) {
      throw Exception(
        'You must connect before you can subscribe to a channel',
      );
    }
    return _manageSubscriptions(
      action: ActionEnum.subscribe,
      channels: channels,
      productIds: productIds,
      channelProductIdMap: channelProductIdMap,
    );
  }

  /// Unsubscribe to specific channels
  Stream<WebsocketResponse> unSubscribe({
    List<ChannelEnum>? channels,
    List<String>? productIds,
    Map<ChannelEnum, List<String>?>? channelProductIdMap,
  }) {
    if (_channel == null) {
      throw Exception(
        'You must connect before you can unsubscribe to a channel',
      );
    }
    return _manageSubscriptions(
      action: ActionEnum.unsubscribe,
      channels: channels,
      productIds: productIds,
      channelProductIdMap: channelProductIdMap,
    );
  }
}
