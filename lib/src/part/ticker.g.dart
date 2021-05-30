// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../lib/ticker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticker _$TickerFromJson(Map<String, dynamic> json) {
  return Ticker(
    tradeId: json['trade_id'] as int?,
    price: (json['price'] as num?)?.toDouble(),
    size: (json['size'] as num?)?.toDouble(),
    bid: (json['bid'] as num?)?.toDouble(),
    ask: (json['ask'] as num?)?.toDouble(),
    volume: (json['volume'] as num?)?.toDouble(),
    time: json['time'] == null ? null : DateTime.parse(json['time'] as String),
  );
}

Map<String, dynamic> _$TickerToJson(Ticker instance) => <String, dynamic>{
      'trade_id': instance.tradeId,
      'price': instance.price,
      'size': instance.size,
      'bid': instance.bid,
      'ask': instance.ask,
      'volume': instance.volume,
      'time': instance.time?.toIso8601String(),
    };
