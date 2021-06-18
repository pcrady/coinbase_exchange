// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../currency.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Currency _$CurrencyFromJson(Map<String, dynamic> json) {
  return Currency(
    id: json['id'] as String?,
    name: json['name'] as String?,
    minSize:
        const StringToDoubleConverter().fromJson(json['min_size'] as String?),
    status: json['status'] as String?,
    maxPrecision: const StringToDoubleConverter()
        .fromJson(json['max_precision'] as String?),
    convertibleTo: json['convertible_to'] as List<dynamic>?,
    details: json['details'] == null
        ? null
        : CurrencyDetails.fromJson(json['details'] as Map<String, dynamic>),
    statusMessage: json['status_message'] as String?,
  );
}

Map<String, dynamic> _$CurrencyToJson(Currency instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'min_size': const StringToDoubleConverter().toJson(instance.minSize),
      'status': instance.status,
      'max_precision':
          const StringToDoubleConverter().toJson(instance.maxPrecision),
      'convertible_to': instance.convertibleTo,
      'details': instance.details?.toJson(),
      'status_message': instance.statusMessage,
    };
