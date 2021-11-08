// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'params.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Params _$ParamsFromJson(Map<String, dynamic> json) => Params(
      startDate: json['start_date'] == null
          ? null
          : DateTime.parse(json['start_date'] as String),
      endDate: json['end_date'] == null
          ? null
          : DateTime.parse(json['end_date'] as String),
      format: json['format'] as String?,
      productId: json['product_id'] as String?,
      accountId: json['account_id'] as String?,
      profileId: json['profile_id'] as String?,
      email: json['email'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      newYorkState: json['new_york_state'] as bool?,
    );

Map<String, dynamic> _$ParamsToJson(Params instance) => <String, dynamic>{
      'start_date': instance.startDate?.toIso8601String(),
      'end_date': instance.endDate?.toIso8601String(),
      'format': instance.format,
      'product_id': instance.productId,
      'account_id': instance.accountId,
      'profile_id': instance.profileId,
      'email': instance.email,
      'user': instance.user,
      'new_york_state': instance.newYorkState,
    };
