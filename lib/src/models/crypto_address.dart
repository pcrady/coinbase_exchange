import 'package:json_annotation/json_annotation.dart';

part 'crypto_address.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class CryptoAddress {
  final String? id;
  final String? address;
  final Map? addressInfo;
  final String? name;
  final DateTime? createdAt;
  final DateTime? updatedAt;
  final String? network;
  final String? uriScheme;
  final String? resource;
  final String? resourcePath;
  final Map? warnings;
  final String? depositUri;
  final String? callbackUrl;
  final bool? exchangeDepositAddress;

  CryptoAddress({
    this.id,
    this.address,
    this.addressInfo,
    this.name,
    this.createdAt,
    this.updatedAt,
    this.network,
    this.uriScheme,
    this.resource,
    this.resourcePath,
    this.warnings,
    this.depositUri,
    this.callbackUrl,
    this.exchangeDepositAddress
  });

  factory CryptoAddress.fromJson(Map<String, dynamic> json) => _$CryptoAddressFromJson(json);

  Map<String, dynamic> toJson() => _$CryptoAddressToJson(this);
}