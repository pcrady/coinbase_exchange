// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Status _$StatusFromJson(Map<String, dynamic> json) {
  return Status(
    currencies: (json['currencies'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Currency.fromJson(e as Map<String, dynamic>))
        .toList(),
    products: (json['products'] as List<dynamic>?)
        ?.map((e) =>
            e == null ? null : Product.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$StatusToJson(Status instance) => <String, dynamic>{
      'products': instance.products?.map((e) => e?.toJson()).toList(),
      'currencies': instance.currencies?.map((e) => e?.toJson()).toList(),
    };