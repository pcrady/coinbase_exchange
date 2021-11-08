// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) => User(
      createdAt: json['created_at'] as String?,
      activeAt: json['active_at'] as String?,
      id: json['id'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      roles: json['roles'],
      isBanned: json['is_banned'] as bool?,
      permissions: json['permissions'] as String?,
      userType: json['user_type'] as String?,
      fulfillsNewRequirements: json['fulfills_new_requirements'] as bool?,
      flags: json['flags'],
      details: json['details'],
      oathClient: json['oath_client'] as String?,
      preferences: json['preferences'] == null
          ? null
          : Preferences.fromJson(json['preferences'] as Map<String, dynamic>),
      hasDefault: json['has_default'] as bool?,
    );

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'created_at': instance.createdAt,
      'active_at': instance.activeAt,
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'roles': instance.roles,
      'is_banned': instance.isBanned,
      'permissions': instance.permissions,
      'user_type': instance.userType,
      'fulfills_new_requirements': instance.fulfillsNewRequirements,
      'flags': instance.flags,
      'details': instance.details,
      'oath_client': instance.oathClient,
      'preferences': instance.preferences,
      'has_default': instance.hasDefault,
    };
