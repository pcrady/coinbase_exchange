import 'package:json_annotation/json_annotation.dart';

part '../part/stats.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Stats {
  final double? open;
  final double? high;
  final double? low;
  final double? volume;
  @JsonKey(name: 'volume_30day')
  final double? volume30Day;

  Stats({
    this.open,
    this.high,
    this.low,
    this.volume,
    this.volume30Day,
  });

  factory Stats.fromJson(Map<String, dynamic> json) => _$StatsFromJson(json);

  Map<String, dynamic> toJson() => _$StatsToJson(this);
}