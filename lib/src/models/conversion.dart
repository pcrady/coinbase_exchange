import '../lib/custom_json_converters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'conversion.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Conversion {
  final String? id;
  @StringToDoubleConverter()
  final double? amount;
  final String? fromAccountId;
  final String? toAccountId;
  final String? from;
  final String? to;

  Conversion({
    this.id,
    this.amount,
    this.fromAccountId,
    this.toAccountId,
    this.from,
    this.to,
  });

  factory Conversion.fromJson(Map<String, dynamic> json) => _$ConversionFromJson(json);

  Map<String, dynamic> toJson() => _$ConversionToJson(this);
}