import '../lib/custom_json_converters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fees.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Fees {
  @StringToDoubleConverter()
  final double? makerFeeRate;
  @StringToDoubleConverter()
  final double? takerFeeRate;
  @StringToDoubleConverter()
  final double? usdVolume;

  Fees({
    this.makerFeeRate,
    this.takerFeeRate,
    this.usdVolume,
  });

  factory Fees.fromJson(Map<String, dynamic> json) =>
    _$FeesFromJson(json);

  Map<String, dynamic> toJson() => _$FeesToJson(this);
}