import '../lib/custom_json_converters.dart';
import '../models/currency_details.dart';
import 'package:json_annotation/json_annotation.dart';

part 'currency.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Currency {
  final String? id;
  final String? name;
  @StringToDoubleConverter()
  final double? minSize;
  final String? status;
  @StringToDoubleConverter()
  final double? maxPrecision;
  final List? convertibleTo;
  final CurrencyDetails? details;
  final String? statusMessage;

  Currency({
    this.id,
    this.name,
    this.minSize,
    this.status,
    this.maxPrecision,
    this.convertibleTo,
    this.details,
    this.statusMessage,
  });

  factory Currency.fromJson(Map<String, dynamic> json) =>
      _$CurrencyFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyToJson(this);
}
