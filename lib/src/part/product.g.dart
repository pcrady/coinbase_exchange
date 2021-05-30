// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../lib/product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] as String?,
    displayName: json['display_name'] as String?,
    baseCurrency: json['base_currency'] as String?,
    quoteCurrency: json['quote_currency'] as String?,
    baseIncrement: (json['base_increment'] as num?)?.toDouble(),
    quoteIncrement: (json['quote_increment'] as num?)?.toDouble(),
    baseMinSize: (json['base_min_size'] as num?)?.toDouble(),
    baseMaxSize: (json['base_max_size'] as num?)?.toDouble(),
    minMarketFunds: (json['min_market_funds'] as num?)?.toDouble(),
    maxMarketFunds: (json['max_market_funds'] as num?)?.toDouble(),
    status: json['status'] as String?,
    statusMessage: json['status_message'] as String?,
    cancelOnly: json['cancel_only'] as bool?,
    limitOnly: json['limit_only'] as bool?,
    postOnly: json['post_only'] as bool?,
    tradingDisabled: json['trading_disabled'] as bool?,
  );
}

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'display_name': instance.displayName,
      'base_currency': instance.baseCurrency,
      'quote_currency': instance.quoteCurrency,
      'base_increment': instance.baseIncrement,
      'quote_increment': instance.quoteIncrement,
      'base_min_size': instance.baseMinSize,
      'base_max_size': instance.baseMaxSize,
      'min_market_funds': instance.minMarketFunds,
      'max_market_funds': instance.maxMarketFunds,
      'status': instance.status,
      'status_message': instance.statusMessage,
      'cancel_only': instance.cancelOnly,
      'limit_only': instance.limitOnly,
      'post_only': instance.postOnly,
      'trading_disabled': instance.tradingDisabled,
    };
