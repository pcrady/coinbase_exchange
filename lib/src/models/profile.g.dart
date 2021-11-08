// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Profile _$ProfileFromJson(Map<String, dynamic> json) => Profile(
      id: json['id'] as String?,
      userId: json['user_id'] as String?,
      name: json['name'] as String?,
      active: json['active'] as bool?,
      isDefault: json['is_default'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      hasMargin: json['has_margin'] as bool?,
    );

Map<String, dynamic> _$ProfileToJson(Profile instance) => <String, dynamic>{
      'id': instance.id,
      'user_id': instance.userId,
      'name': instance.name,
      'active': instance.active,
      'is_default': instance.isDefault,
      'created_at': instance.createdAt?.toIso8601String(),
      'has_margin': instance.hasMargin,
    };
