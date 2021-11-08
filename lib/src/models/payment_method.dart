import '../models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_method.g.dart';

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
  // TODO make class
  final Map? limits;
  final bool? allowBuy;
  final bool? allowSell;
  final bool? allowDeposit;
  final bool? allowWithdraw;
  final Map? fiatAccounts;
  final bool? verified;
  // Todo make class
  final Map? pickerData;
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

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => _$PaymentMethodFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodToJson(this);
}