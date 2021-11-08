// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transaction _$TransactionFromJson(Map<String, dynamic> json) => Transaction(
      id: json['id'] as String?,
      amount:
          const StringToDoubleConverter().fromJson(json['amount'] as String?),
      currency: json['currency'] as String?,
      payoutAt: json['payout_at'] as String?,
      fee: const StringToDoubleConverter().fromJson(json['fee'] as String?),
      subtotal:
          const StringToDoubleConverter().fromJson(json['subtotal'] as String?),
    );

Map<String, dynamic> _$TransactionToJson(Transaction instance) =>
    <String, dynamic>{
      'id': instance.id,
      'amount': const StringToDoubleConverter().toJson(instance.amount),
      'currency': instance.currency,
      'payout_at': instance.payoutAt,
      'fee': const StringToDoubleConverter().toJson(instance.fee),
      'subtotal': const StringToDoubleConverter().toJson(instance.subtotal),
    };
