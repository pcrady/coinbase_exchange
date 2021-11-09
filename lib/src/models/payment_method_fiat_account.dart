import 'package:json_annotation/json_annotation.dart';

part 'payment_method_fiat_account.g.dart';

/// An object which contains information about fiat accounts for payment methods
@JsonSerializable(fieldRename: FieldRename.snake)
class PaymentMethodFiatAccount {
  final String? id;
  final String? resource;
  final String? resourcePath;

  PaymentMethodFiatAccount({this.id, this.resource, this.resourcePath});

  factory PaymentMethodFiatAccount.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFiatAccountFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodFiatAccountToJson(this);
}
