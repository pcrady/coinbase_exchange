// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'currency_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CurrencyDetails _$CurrencyDetailsFromJson(Map<String, dynamic> json) =>
    CurrencyDetails(
      type: json['type'] as String?,
      symbol: json['symbol'] as String?,
      networkConfirmations: json['network_confirmations'] as int?,
      sortOrder: json['sort_order'] as int?,
      cryptoAddressLink: json['crypto_address_link'] as String?,
      cryptoTransactionLink: json['crypto_transaction_link'] as String?,
      pushPaymentMethods: (json['push_payment_methods'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      groupTypes: (json['group_types'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      displayName: json['display_name'] as String?,
      processingTimeSeconds: json['processing_time_seconds'] as int?,
      minWithdrawalAmount: (json['min_withdrawal_amount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$CurrencyDetailsToJson(CurrencyDetails instance) =>
    <String, dynamic>{
      'type': instance.type,
      'symbol': instance.symbol,
      'network_confirmations': instance.networkConfirmations,
      'sort_order': instance.sortOrder,
      'crypto_address_link': instance.cryptoAddressLink,
      'crypto_transaction_link': instance.cryptoTransactionLink,
      'push_payment_methods': instance.pushPaymentMethods,
      'group_types': instance.groupTypes,
      'display_name': instance.displayName,
      'processing_time_seconds': instance.processingTimeSeconds,
      'min_withdrawal_amount': instance.minWithdrawalAmount,
    };
