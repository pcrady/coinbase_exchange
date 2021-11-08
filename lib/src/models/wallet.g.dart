// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Wallet _$WalletFromJson(Map<String, dynamic> json) => Wallet(
      availableOnConsumer: json['available_on_consumer'] as bool?,
      holdBalance: const StringToDoubleConverter()
          .fromJson(json['hold_balance'] as String?),
      id: json['id'] as String?,
      holdCurrency: json['hold_currency'] as String?,
      balance:
          const StringToDoubleConverter().fromJson(json['balance'] as String?),
      currency: json['currency'] as String?,
      primary: json['primary'] as bool?,
      name: json['name'] as String?,
      type: json['type'] as String?,
      active: json['active'] as bool?,
    );

Map<String, dynamic> _$WalletToJson(Wallet instance) => <String, dynamic>{
      'available_on_consumer': instance.availableOnConsumer,
      'hold_balance':
          const StringToDoubleConverter().toJson(instance.holdBalance),
      'id': instance.id,
      'hold_currency': instance.holdCurrency,
      'balance': const StringToDoubleConverter().toJson(instance.balance),
      'currency': instance.currency,
      'primary': instance.primary,
      'name': instance.name,
      'type': instance.type,
      'active': instance.active,
    };
