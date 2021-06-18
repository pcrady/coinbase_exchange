// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) {
  return Product(
    id: json['id'] as String?,
    displayName: json['display_name'] as String?,
    baseCurrency: json['base_currency'] as String?,
    quoteCurrency: json['quote_currency'] as String?,
    baseIncrement: const StringToDoubleConverter()
        .fromJson(json['base_increment'] as String?),
    quoteIncrement: const StringToDoubleConverter()
        .fromJson(json['quote_increment'] as String?),
    baseMinSize: const StringToDoubleConverter()
        .fromJson(json['base_min_size'] as String?),
    baseMaxSize: const StringToDoubleConverter()
        .fromJson(json['base_max_size'] as String?),
    minMarketFunds: const StringToDoubleConverter()
        .fromJson(json['min_market_funds'] as String?),
    maxMarketFunds: const StringToDoubleConverter()
        .fromJson(json['max_market_funds'] as String?),
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
      'base_increment':
          const StringToDoubleConverter().toJson(instance.baseIncrement),
      'quote_increment':
          const StringToDoubleConverter().toJson(instance.quoteIncrement),
      'base_min_size':
          const StringToDoubleConverter().toJson(instance.baseMinSize),
      'base_max_size':
          const StringToDoubleConverter().toJson(instance.baseMaxSize),
      'min_market_funds':
          const StringToDoubleConverter().toJson(instance.minMarketFunds),
      'max_market_funds':
          const StringToDoubleConverter().toJson(instance.maxMarketFunds),
      'status': instance.status,
      'status_message': instance.statusMessage,
      'cancel_only': instance.cancelOnly,
      'limit_only': instance.limitOnly,
      'post_only': instance.postOnly,
      'trading_disabled': instance.tradingDisabled,
    };
