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
      side: _$enumDecodeNullable(_$SideEnumEnumMap, json['side']),
    );

Map<String, dynamic> _$TradeToJson(Trade instance) => <String, dynamic>{
      'time': instance.time?.toIso8601String(),
      'trade_id': instance.tradeId,
      'price': const StringToDoubleConverter().toJson(instance.price),
      'size': const StringToDoubleConverter().toJson(instance.size),
      'side': _$SideEnumEnumMap[instance.side],
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

const _$SideEnumEnumMap = {
  SideEnum.buy: 'buy',
  SideEnum.sell: 'sell',
};
