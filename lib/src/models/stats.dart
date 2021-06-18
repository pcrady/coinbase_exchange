import 'package:coinbase_dart/src/lib/custom_json_converters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'parts/stats.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Stats {
  @StringToDoubleConverter()
  final double? open;
  @StringToDoubleConverter()
  final double? high;
  @StringToDoubleConverter()
  final double? low;
  @StringToDoubleConverter()
  final double? volume;
  @StringToDoubleConverter()
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