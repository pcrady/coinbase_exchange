// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'conversion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Conversion _$ConversionFromJson(Map<String, dynamic> json) => Conversion(
      id: json['id'] as String?,
      amount:
          const StringToDoubleConverter().fromJson(json['amount'] as String?),
      fromAccountId: json['from_account_id'] as String?,
      toAccountId: json['to_account_id'] as String?,
      from: json['from'] as String?,
      to: json['to'] as String?,
    );

Map<String, dynamic> _$ConversionToJson(Conversion instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': const StringToDoubleConverter().toJson(instance.amount),
      'from_account_id': instance.fromAccountId,
      'to_account_id': instance.toAccountId,
      'from': instance.from,
      'to': instance.to,
    };
