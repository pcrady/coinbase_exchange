import 'package:json_annotation/json_annotation.dart';

part 'signed_prices.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class SignedPrices {
  final DateTime? timestamp;
  final List? messages;
  final List? signatures;
  final Map? prices;

  SignedPrices({
    this.timestamp,
    this.messages,
    this.signatures,
    this.prices,
  });

  factory SignedPrices.fromJson(Map<String, dynamic> json) =>
    _$SignedPricesFromJson(json);

  Map<String, dynamic> toJson() => _$SignedPricesToJson(this);
}