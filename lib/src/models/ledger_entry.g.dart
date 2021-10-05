// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ledger_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LedgerEntry _$LedgerEntryFromJson(Map<String, dynamic> json) {
  return LedgerEntry(
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    id: json['id'] as String?,
    amount: const StringToDoubleConverter().fromJson(json['amount'] as String?),
    balance:
        const StringToDoubleConverter().fromJson(json['balance'] as String?),
    type: json['type'] as String?,
    details: (json['details'] as Map<String, dynamic>?)?.map(
      (k, e) => MapEntry(k, e as String),
    ),
  );
}

Map<String, dynamic> _$LedgerEntryToJson(LedgerEntry instance) =>
    <String, dynamic>{
      'created_at': instance.createdAt?.toIso8601String(),
      'id': instance.id,
      'amount': const StringToDoubleConverter().toJson(instance.amount),
      'balance': const StringToDoubleConverter().toJson(instance.balance),
      'type': instance.type,
      'details': instance.details,
    };
