// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_ticker.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StreamTicker _$StreamTickerFromJson(Map<String, dynamic> json) {
  return StreamTicker(
    tradeId: json['trade_id'] as int?,
    sequence: json['sequence'] as int?,
    price: const StringToDoubleConverter().fromJson(json['price'] as String?),
    time: json['time'] == null ? null : DateTime.parse(json['time'] as String),
    productId: json['product_id'] as String?,
    side: json['side'] as String?,
    lastSize:
        const StringToDoubleConverter().fromJson(json['last_size'] as String?),
    bestAsk:
        const StringToDoubleConverter().fromJson(json['best_ask'] as String?),
    bestBid:
        const StringToDoubleConverter().fromJson(json['best_bid'] as String?),
  );
}

Map<String, dynamic> _$StreamTickerToJson(StreamTicker instance) =>
    <String, dynamic>{
      'trade_id': instance.tradeId,
      'sequence': instance.sequence,
      'time': instance.time?.toIso8601String(),
      'product_id': instance.productId,
      'price': const StringToDoubleConverter().toJson(instance.price),
      'side': instance.side,
      'last_size': const StringToDoubleConverter().toJson(instance.lastSize),
      'best_bid': const StringToDoubleConverter().toJson(instance.bestBid),
      'best_ask': const StringToDoubleConverter().toJson(instance.bestAsk),
    };
