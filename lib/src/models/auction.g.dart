// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auction.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Auction _$AuctionFromJson(Map<String, dynamic> json) => Auction(
      type: json['type'] as String?,
      productId: json['product_id'] as String?,
      sequence: json['sequence'] as int?,
      auctionState: json['auction_state'] as String?,
      bestBidPrice: const StringToDoubleConverter()
          .fromJson(json['best_bid_price'] as String?),
      bestBidSize: const StringToDoubleConverter()
          .fromJson(json['best_bid_size'] as String?),
      bestAskPrice: const StringToDoubleConverter()
          .fromJson(json['best_ask_price'] as String?),
      bestAskSize: const StringToDoubleConverter()
          .fromJson(json['best_ask_size'] as String?),
      openPrice: const StringToDoubleConverter()
          .fromJson(json['open_price'] as String?),
      openSize: const StringToDoubleConverter()
          .fromJson(json['open_size'] as String?),
      canOpen: json['can_open'] as String?,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$AuctionToJson(Auction instance) => <String, dynamic>{
      'type': instance.type,
      'product_id': instance.productId,
      'sequence': instance.sequence,
      'auction_state': instance.auctionState,
      'best_bid_price':
          const StringToDoubleConverter().toJson(instance.bestBidPrice),
      'best_bid_size':
          const StringToDoubleConverter().toJson(instance.bestBidSize),
      'best_ask_price':
          const StringToDoubleConverter().toJson(instance.bestAskPrice),
      'best_ask_size':
          const StringToDoubleConverter().toJson(instance.bestAskSize),
      'open_price': const StringToDoubleConverter().toJson(instance.openPrice),
      'open_size': const StringToDoubleConverter().toJson(instance.openSize),
      'can_open': instance.canOpen,
      'timestamp': instance.timestamp?.toIso8601String(),
    };
