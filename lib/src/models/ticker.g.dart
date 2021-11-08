// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ticker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Ticker _$TickerFromJson(Map<String, dynamic> json) => Ticker(
      type: json['type'] as String?,
      tradeId: json['trade_id'] as int?,
      price: const StringToDoubleConverter().fromJson(json['price'] as String?),
      size: const StringToDoubleConverter().fromJson(json['size'] as String?),
      bid: const StringToDoubleConverter().fromJson(json['bid'] as String?),
      ask: const StringToDoubleConverter().fromJson(json['ask'] as String?),
      volume:
          const StringToDoubleConverter().fromJson(json['volume'] as String?),
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$TickerToJson(Ticker instance) => <String, dynamic>{
      'type': instance.type,
      'trade_id': instance.tradeId,
      'price': const StringToDoubleConverter().toJson(instance.price),
      'size': const StringToDoubleConverter().toJson(instance.size),
      'bid': const StringToDoubleConverter().toJson(instance.bid),
      'ask': const StringToDoubleConverter().toJson(instance.ask),
      'volume': const StringToDoubleConverter().toJson(instance.volume),
      'time': instance.time?.toIso8601String(),
    };
