// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'trade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trade _$TradeFromJson(Map<String, dynamic> json) => Trade(
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
      tradeId: json['trade_id'] as int?,
      price: const StringToDoubleConverter().fromJson(json['price'] as String?),
      size: const StringToDoubleConverter().fromJson(json['size'] as String?),
      side: $enumDecodeNullable(_$SideEnumEnumMap, json['side']),
    );

Map<String, dynamic> _$TradeToJson(Trade instance) => <String, dynamic>{
      'time': instance.time?.toIso8601String(),
      'trade_id': instance.tradeId,
      'price': const StringToDoubleConverter().toJson(instance.price),
      'size': const StringToDoubleConverter().toJson(instance.size),
      'side': _$SideEnumEnumMap[instance.side],
    };

const _$SideEnumEnumMap = {
  SideEnum.buy: 'buy',
  SideEnum.sell: 'sell',
};
