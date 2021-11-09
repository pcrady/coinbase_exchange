import 'package:coinbase_exchange/coinbase_exchange.dart';

import '../lib/websocket_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'heartbeat.g.dart';

/// An object returned once per second by the [WebsocketClient]
/// for a particular product.
@JsonSerializable(fieldRename: FieldRename.snake)
class Heartbeat extends WebsocketResponse {
  final String? type;
  final int? sequence;
  final int? lastTradeId;
  final String? productId;
  final DateTime? time;

  Heartbeat({
    this.type,
    this.sequence,
    this.lastTradeId,
    this.productId,
    this.time,
  });

  factory Heartbeat.fromJson(Map<String, dynamic> json) =>
      _$HeartbeatFromJson(json);

  Map<String, dynamic> toJson() => _$HeartbeatToJson(this);
}
