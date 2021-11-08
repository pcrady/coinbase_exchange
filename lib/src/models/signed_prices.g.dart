// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'signed_prices.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignedPrices _$SignedPricesFromJson(Map<String, dynamic> json) => SignedPrices(
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      messages: json['messages'] as List<dynamic>?,
      signatures: json['signatures'] as List<dynamic>?,
      prices: json['prices'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$SignedPricesToJson(SignedPrices instance) =>
    <String, dynamic>{
      'timestamp': instance.timestamp?.toIso8601String(),
      'messages': instance.messages,
      'signatures': instance.signatures,
      'prices': instance.prices,
    };
