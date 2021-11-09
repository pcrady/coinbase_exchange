// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_method_fiat_account.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentMethodFiatAccount _$PaymentMethodFiatAccountFromJson(
        Map<String, dynamic> json) =>
    PaymentMethodFiatAccount(
      id: json['id'] as String?,
      resource: json['resource'] as String?,
      resourcePath: json['resource_path'] as String?,
    );

Map<String, dynamic> _$PaymentMethodFiatAccountToJson(
        PaymentMethodFiatAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'resource': instance.resource,
      'resource_path': instance.resourcePath,
    };
