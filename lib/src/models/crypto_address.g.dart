// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'crypto_address.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CryptoAddress _$CryptoAddressFromJson(Map<String, dynamic> json) {
  return CryptoAddress(
    id: json['id'] as String?,
    address: json['address'] as String?,
    addressInfo: json['address_info'] as Map<String, dynamic>?,
    name: json['name'] as String?,
    createdAt: json['created_at'] == null
        ? null
        : DateTime.parse(json['created_at'] as String),
    updatedAt: json['updated_at'] == null
        ? null
        : DateTime.parse(json['updated_at'] as String),
    network: json['network'] as String?,
    uriScheme: json['uri_scheme'] as String?,
    resource: json['resource'] as String?,
    resourcePath: json['resource_path'] as String?,
    warnings: json['warnings'] as Map<String, dynamic>?,
    depositUri: json['deposit_uri'] as String?,
    callbackUrl: json['callback_url'] as String?,
    exchangeDepositAddress: json['exchange_deposit_address'] as bool?,
  );
}

Map<String, dynamic> _$CryptoAddressToJson(CryptoAddress instance) =>
    <String, dynamic>{
      'id': instance.id,
      'address': instance.address,
      'address_info': instance.addressInfo,
      'name': instance.name,
      'created_at': instance.createdAt?.toIso8601String(),
      'updated_at': instance.updatedAt?.toIso8601String(),
      'network': instance.network,
      'uri_scheme': instance.uriScheme,
      'resource': instance.resource,
      'resource_path': instance.resourcePath,
      'warnings': instance.warnings,
      'deposit_uri': instance.depositUri,
      'callback_url': instance.callbackUrl,
      'exchange_deposit_address': instance.exchangeDepositAddress,
    };
