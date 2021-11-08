// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fill.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fill _$FillFromJson(Map<String, dynamic> json) => Fill(
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      tradeId: json['trade_id'] as int?,
      productId: json['product_id'] as String?,
      userId: json['user_id'] as String?,
      profileId: json['profile_id'] as String?,
      liquidity: json['liquidity'] as String?,
      price: const StringToDoubleConverter().fromJson(json['price'] as String?),
      size: const StringToDoubleConverter().fromJson(json['size'] as String?),
      fee: const StringToDoubleConverter().fromJson(json['fee'] as String?),
      sell: json['sell'] as String?,
      side: _$enumDecodeNullable(_$CoinbaseSideEnumMap, json['side']),
      settled: json['settled'] as bool?,
      usdVolume: const StringToDoubleConverter()
          .fromJson(json['usd_volume'] as String?),
    );

Map<String, dynamic> _$FillToJson(Fill instance) => <String, dynamic>{
      'created_at': instance.createdAt?.toIso8601String(),
      'trade_id': instance.tradeId,
      'product_id': instance.productId,
      'user_id': instance.userId,
      'profile_id': instance.profileId,
      'liquidity': instance.liquidity,
      'price': const StringToDoubleConverter().toJson(instance.price),
      'size': const StringToDoubleConverter().toJson(instance.size),
      'fee': const StringToDoubleConverter().toJson(instance.fee),
      'sell': instance.sell,
      'side': _$CoinbaseSideEnumMap[instance.side],
      'settled': instance.settled,
      'usd_volume': const StringToDoubleConverter().toJson(instance.usdVolume),
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

const _$CoinbaseSideEnumMap = {
  CoinbaseSide.buy: 'buy',
  CoinbaseSide.sell: 'sell',
};
