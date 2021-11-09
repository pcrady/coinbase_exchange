import 'package:coinbase_exchange/coinbase_exchange.dart';

import '../lib/websocket_response.dart';

/// An simple error class for [WebsocketClient] errors.
class WebsocketError extends WebsocketResponse {
  final String? message;

  WebsocketError({this.message});
}
