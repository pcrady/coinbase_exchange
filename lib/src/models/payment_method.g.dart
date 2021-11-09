// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethod _$PaymentMethodFromJson(Map<String, dynamic> json) =>
    PaymentMethod(
      id: json['id'] as String?,
      type: json['type'] as String?,
      name: json['name'] as String?,
      currency: json['currency'] as String?,
      primaryBuy: json['primary_buy'] as bool?,
      primarySell: json['primary_sell'] as bool?,
      instantBuy: json['instant_buy'] as bool?,
      instantSell: json['instant_sell'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      resource: json['resource'] as String?,
      resourcePath: json['resource_path'] as String?,
      limits: json['limits'] == null
          ? null
          : PaymentMethodLimits.fromJson(
              json['limits'] as Map<String, dynamic>),
      allowBuy: json['allow_buy'] as bool?,
      allowSell: json['allow_sell'] as bool?,
      allowDeposit: json['allow_deposit'] as bool?,
      allowWithdraw: json['allow_withdraw'] as bool?,
      fiatAccounts: json['fiat_accounts'] == null
          ? null
          : PaymentMethodFiatAccount.fromJson(
              json['fiat_accounts'] as Map<String, dynamic>),
      verified: json['verified'] as bool?,
      pickerData: json['picker_data'] == null
          ? null
          : PaymentMethodPickerData.fromJson(
              json['picker_data'] as Map<String, dynamic>),
      holdBusinessDays: json['hold_business_days'] as int?,
      holdDays: json['hold_days'] as int?,
    );

Map<String, dynamic> _$PaymentMethodToJson(PaymentMethod instance) =>
    <String, dynamic>{
      'id': instance.id,
      'type': instance.type,
      'name': instance.name,
      'currency': instance.currency,
      'primary_buy': instance.primaryBuy,
      'primary_sell': instance.primarySell,
      'instant_buy': instance.instantBuy,
      'instant_sell': instance.instantSell,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'resource': instance.resource,
      'resource_path': instance.resourcePath,
      'limits': instance.limits,
      'allow_buy': instance.allowBuy,
      'allow_sell': instance.allowSell,
      'allow_deposit': instance.allowDeposit,
      'allow_withdraw': instance.allowWithdraw,
      'fiat_accounts': instance.fiatAccounts,
      'verified': instance.verified,
      'picker_data': instance.pickerData,
      'hold_business_days': instance.holdBusinessDays,
      'hold_days': instance.holdDays,
    };
