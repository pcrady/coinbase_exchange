import '../lib/websocket_response.dart';

class WebsocketError extends WebsocketResponse {
  final String? message;

  WebsocketError({this.message});
}