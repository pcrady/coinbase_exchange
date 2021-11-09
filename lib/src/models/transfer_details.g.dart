// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transfer_details.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TransferDetails _$TransferDetailsFromJson(Map<String, dynamic> json) =>
    TransferDetails(
      coinbaseAccountId: json['coinbase_account_id'] as String?,
      coinbaseTransactionId: json['coinbase_transaction_id'] as String?,
      coinbasePaymentMethodId: json['coinbase_payment_method_id'] as String?,
    );

Map<String, dynamic> _$TransferDetailsToJson(TransferDetails instance) =>
    <String, dynamic>{
      'coinbase_account_id': instance.coinbaseAccountId,
      'coinbase_transaction_id': instance.coinbaseTransactionId,
      'coinbase_payment_method_id': instance.coinbasePaymentMethodId,
    };
