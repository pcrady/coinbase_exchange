import 'package:json_annotation/json_annotation.dart';

part 'parts/heartbeat.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Heartbeat {
  final int? sequence;
  final int? lastTradeId;
  final String? productId;
  final DateTime? time;

  Heartbeat({
    this.sequence,
    this.lastTradeId,
    this.productId,
    this.time
  });

  factory Heartbeat.fromJson(Map<String, dynamic> json) => _$HeartbeatFromJson(json);

  Map<String, dynamic> toJson() => _$HeartbeatToJson(this);
}