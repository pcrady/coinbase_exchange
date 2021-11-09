// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_limits.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethodLimits _$PaymentMethodLimitsFromJson(Map<String, dynamic> json) =>
    PaymentMethodLimits(
      type: json['type'] as String?,
      name: json['name'] as String?,
    );

Map<String, dynamic> _$PaymentMethodLimitsToJson(
        PaymentMethodLimits instance) =>
    <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
    };
