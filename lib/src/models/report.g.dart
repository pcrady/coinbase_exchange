// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Report _$ReportFromJson(Map<String, dynamic> json) => Report(
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      completedAt: json['completed_at'] == null
          ? null
          : DateTime.parse(json['completed_at'] as String),
      expiresAt: json['expires_at'] == null
          ? null
          : DateTime.parse(json['expires_at'] as String),
      id: json['id'] as String?,
      type: json['type'] as String?,
      status: json['status'] as String?,
      userId: json['user_id'] as String?,
      fileUrl: json['file_url'] as String?,
      params: json['params'] == null
          ? null
          : Params.fromJson(json['params'] as Map<String, dynamic>),
      fileCount: json['file_count'] as int?,
    );

Map<String, dynamic> _$ReportToJson(Report instance) => <String, dynamic>{
      'created_at': instance.createdAt?.toIso8601String(),
      'completed_at': instance.completedAt?.toIso8601String(),
      'expires_at': instance.expiresAt?.toIso8601String(),
      'id': instance.id,
      'type': instance.type,
      'status': instance.status,
      'user_id': instance.userId,
      'file_url': instance.fileUrl,
      'params': instance.params,
      'file_count': instance.fileCount,
    };
