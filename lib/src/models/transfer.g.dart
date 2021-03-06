// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Transfer _$TransferFromJson(Map<String, dynamic> json) => Transfer(
      id: json['id'] as String?,
      type: $enumDecodeNullable(_$TransferEnumEnumMap, json['type']),
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      completedAt: json['completed_at'] == null
          ? null
          : DateTime.parse(json['completed_at'] as String),
      canceledAt: json['canceled_at'] == null
          ? null
          : DateTime.parse(json['canceled_at'] as String),
      processedAt: json['processed_at'] == null
          ? null
          : DateTime.parse(json['processed_at'] as String),
      userNonce: json['user_nonce'] as String?,
      amount:
          const StringToDoubleConverter().fromJson(json['amount'] as String?),
      details: json['details'] == null
          ? null
          : TransferDetails.fromJson(json['details'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TransferToJson(Transfer instance) => <String, dynamic>{
      'id': instance.id,
      'type': _$TransferEnumEnumMap[instance.type],
      'created_at': instance.createdAt?.toIso8601String(),
      'completed_at': instance.completedAt?.toIso8601String(),
      'canceled_at': instance.canceledAt?.toIso8601String(),
      'processed_at': instance.processedAt?.toIso8601String(),
      'user_nonce': instance.userNonce,
      'amount': const StringToDoubleConverter().toJson(instance.amount),
      'details': instance.details?.toJson(),
    };

const _$TransferEnumEnumMap = {
  TransferEnum.withdrawal: 'withdrawal',
  TransferEnum.deposit: 'deposit',
};
