import 'package:coinbase_exchange/coinbase_exchange.dart';
import 'package:coinbase_exchange/src/models/payment_method_limits.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_method.g.dart';

/// An object which contains information about a transfer of funds.
@JsonSerializable(fieldRename: FieldRename.snake)
class PaymentMethod {
  final String? id;
  final String? type;
  final String? name;
  final String? currency;
  final bool? primaryBuy;
  final bool? primarySell;
  final bool? instantBuy;
  final bool? instantSell;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? resource;
  final String? resourcePath;
  final PaymentMethodLimits? limits;
  final bool? allowBuy;
  final bool? allowSell;
  final bool? allowDeposit;
  final bool? allowWithdraw;
  final PaymentMethodFiatAccount? fiatAccounts;
  final bool? verified;
  final PaymentMethodPickerData? pickerData;
  final int? holdBusinessDays;
  final int? holdDays;

  PaymentMethod({
    this.id,
    this.type,
    this.name,
    this.currency,
    this.primaryBuy,
    this.primarySell,
    this.instantBuy,
    this.instantSell,
    this.createdAt,
    this.updatedAt,
    this.resource,
    this.resourcePath,
    this.limits,
    this.allowBuy,
    this.allowSell,
    this.allowDeposit,
    this.allowWithdraw,
    this.fiatAccounts,
    this.verified,
    this.pickerData,
    this.holdBusinessDays,
    this.holdDays,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) =>
      _$PaymentMethodFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);
}
