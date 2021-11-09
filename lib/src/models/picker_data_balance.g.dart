// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'picker_data_balance.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PickerDataBalance _$PickerDataBalanceFromJson(Map<String, dynamic> json) =>
    PickerDataBalance(
      amount:
          const StringToDoubleConverter().fromJson(json['amount'] as String?),
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$PickerDataBalanceToJson(PickerDataBalance instance) =>
    <String, dynamic>{
      'amount': const StringToDoubleConverter().toJson(instance.amount),
      'currency': instance.currency,
    };
