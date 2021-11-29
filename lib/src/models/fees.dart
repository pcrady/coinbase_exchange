import '../lib/custom_json_converters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'fees.g.dart';

/// An object representing a user's fees.
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Fees {
  @StringToDoubleConverter()
  final double? makerFeeRate;
  @StringToDoubleConverter()
  final double? takerFeeRate;
  @StringToDoubleConverter()
  final double? usdVolume;
  @StringToDoubleConverter()
  final double? feeUsdTotal;

  Fees({
    this.makerFeeRate,
    this.takerFeeRate,
    this.usdVolume,
    this.feeUsdTotal,
  });

  factory Fees.fromJson(Map<String, dynamic> json) => _$FeesFromJson(json);

  Map<String, dynamic> toJson() => _$FeesToJson(this);
}
