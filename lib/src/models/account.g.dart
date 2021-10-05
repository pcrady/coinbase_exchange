// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Account _$AccountFromJson(Map<String, dynamic> json) {
  return Account(
    id: json['id'] as String?,
    currency: json['currency'] as String?,
    balance:
        const StringToDoubleConverter().fromJson(json['balance'] as String?),
    available:
        const StringToDoubleConverter().fromJson(json['available'] as String?),
    hold: const StringToDoubleConverter().fromJson(json['hold'] as String?),
    tradingEnabled: json['trading_enabled'] as bool?,
  );
}

Map<String, dynamic> _$AccountToJson(Account instance) => <String, dynamic>{
      'id': instance.id,
      'currency': instance.currency,
      'balance': const StringToDoubleConverter().toJson(instance.balance),
      'available': const StringToDoubleConverter().toJson(instance.available),
      'hold': const StringToDoubleConverter().toJson(instance.hold),
      'trading_enabled': instance.tradingEnabled,
    };