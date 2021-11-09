// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_picker_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethodPickerData _$PaymentMethodPickerDataFromJson(
        Map<String, dynamic> json) =>
    PaymentMethodPickerData(
      symbol: json['symbol'] as String?,
      balance: json['balance'] == null
          ? null
          : PickerDataBalance.fromJson(json['balance'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentMethodPickerDataToJson(
        PaymentMethodPickerData instance) =>
    <String, dynamic>{
      'symbol': instance.symbol,
      'balance': instance.balance,
    };
