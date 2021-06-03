// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderBook _$OrderBookFromJson(Map<String, dynamic> json) {
  return OrderBook(
    sequence: json['sequence'] as int?,
    bids: (json['bids'] as List<dynamic>?)
        ?.map((e) => e as List<dynamic>?)
        .toList(),
    asks: (json['asks'] as List<dynamic>?)
        ?.map((e) => e as List<dynamic>?)
        .toList(),
  );
}

Map<String, dynamic> _$OrderBookToJson(OrderBook instance) => <String, dynamic>{
      'sequence': instance.sequence,
      'bids': instance.bids,
      'asks': instance.asks,
    };
