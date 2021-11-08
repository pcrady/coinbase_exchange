// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Match _$MatchFromJson(Map<String, dynamic> json) => Match(
      type: json['type'] as String?,
      tradeId: json['trade_id'] as int?,
      sequence: json['sequence'] as int?,
      makerOrderId: json['maker_order_id'] as String?,
      takerOrderId: json['taker_order_id'] as String?,
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
      productId: json['product_id'] as String?,
      size: const StringToDoubleConverter().fromJson(json['size'] as String?),
      price: const StringToDoubleConverter().fromJson(json['price'] as String?),
      side: _$enumDecodeNullable(_$CoinbaseSideEnumMap, json['side']),
      takerUserId: json['taker_user_id'] as String?,
      userId: json['user_id'] as String?,
      takerProfileId: json['taker_profile_id'] as String?,
      profileId: json['profile_id'] as String?,
      takerFeeRate: const StringToDoubleConverter()
          .fromJson(json['taker_fee_rate'] as String?),
      makerUserId: json['maker_user_id'] as String?,
      makerProfileId: json['maker_profile_id'] as String?,
      makerFeeRate: json['maker_fee_rate'] as String?,
    );

Map<String, dynamic> _$MatchToJson(Match instance) => <String, dynamic>{
      'type': instance.type,
      'trade_id': instance.tradeId,
      'sequence': instance.sequence,
      'maker_order_id': instance.makerOrderId,
      'taker_order_id': instance.takerOrderId,
      'time': instance.time?.toIso8601String(),
      'product_id': instance.productId,
      'size': const StringToDoubleConverter().toJson(instance.size),
      'price': const StringToDoubleConverter().toJson(instance.price),
      'side': _$CoinbaseSideEnumMap[instance.side],
      'taker_user_id': instance.takerUserId,
      'user_id': instance.userId,
      'taker_profile_id': instance.takerProfileId,
      'profile_id': instance.profileId,
      'taker_fee_rate':
          const StringToDoubleConverter().toJson(instance.takerFeeRate),
      'maker_user_id': instance.makerUserId,
      'maker_profile_id': instance.makerProfileId,
      'maker_fee_rate': instance.makerFeeRate,
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
