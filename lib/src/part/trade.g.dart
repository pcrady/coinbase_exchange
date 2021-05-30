// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../lib/trade.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Trade _$TradeFromJson(Map<String, dynamic> json) {
  return Trade(
    time: json['time'] == null ? null : DateTime.parse(json['time'] as String),
    tradeId: json['trade_id'] as int?,
    price: (json['price'] as num?)?.toDouble(),
    size: (json['size'] as num?)?.toDouble(),
    side: _$enumDecodeNullable(_$SideEnumMap, json['side']),
  );
}

Map<String, dynamic> _$TradeToJson(Trade instance) => <String, dynamic>{
      'time': instance.time?.toIso8601String(),
      'trade_id': instance.tradeId,
      'price': instance.price,
      'size': instance.size,
      'side': _$SideEnumMap[instance.side],
    };

K _$enumDecode<K, V>(
  Map<K, V> enumValues,
  Object? source, {
  K? unknownValue,
}) {
  if (source == null) {
    throw ArgumentError(
      'A value must be provided. Supported values: '
      '${enumValues.values.join(', ')}',
    );
  }

  return enumValues.entries.singleWhere(
    (e) => e.value == source,
    orElse: () {
      if (unknownValue == null) {
        throw ArgumentError(
          '`$source` is not one of the supported values: '
          '${enumValues.values.join(', ')}',
        );
      }
      return MapEntry(unknownValue, enumValues.values.first);
    },
  ).key;
}

K? _$enumDecodeNullable<K, V>(
  Map<K, V> enumValues,
  dynamic source, {
  K? unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<K, V>(enumValues, source, unknownValue: unknownValue);
}

const _$SideEnumMap = {
  Side.buy: 'buy',
  Side.sell: 'sell',
};
