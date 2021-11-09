import 'package:json_annotation/json_annotation.dart';

part 'payment_method_limits.g.dart';

/// An object which contains information about limits for payment methods
@JsonSerializable(fieldRename: FieldRename.snake)
class PaymentMethodLimits {
  final String? type;
  final String? name;

  PaymentMethodLimits({
    this.type,
    this.name,
  });

  factory PaymentMethodLimits.fromJson(Map<String, dynamic> json) =>
    _$PaymentMethodLimitsFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodLimitsToJson(this);
}