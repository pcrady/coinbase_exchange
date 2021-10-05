// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hold.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Hold _$HoldFromJson(Map<String, dynamic> json) {
  return Hold(
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    id: json['id'] as String?,
    amount: const StringToDoubleConverter().fromJson(json['amount'] as String?),
    type: json['type'] as String?,
    ref: json['ref'] as String?,
  );
}

Map<String, dynamic> _$HoldToJson(Hold instance) => <String, dynamic>{
      'created_at': instance.createdAt?.toIso8601String(),
      'id': instance.id,
      'amount': const StringToDoubleConverter().toJson(instance.amount),
      'type': instance.type,
      'ref': instance.ref,
    };
