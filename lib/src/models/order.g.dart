// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Order _$OrderFromJson(Map<String, dynamic> json) => Order(
      id: json['id'] as String?,
      price: const StringToDoubleConverter().fromJson(json['price'] as String?),
      size: const StringToDoubleConverter().fromJson(json['size'] as String?),
      productId: json['product_id'] as String?,
      profileId: json['profile_id'] as String?,
      side: _$enumDecodeNullable(_$CoinbaseSideEnumMap, json['side']),
      type: _$enumDecodeNullable(_$CoinbaseOrderTypeEnumMap, json['type']),
      timeInForce: json['time_in_force'] as String?,
      postOnly: json['post_only'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      fillFees: (json['fill_fees'] as num?)?.toDouble(),
      filledSize: (json['filled_size'] as num?)?.toDouble(),
      executedValue: (json['executed_value'] as num?)?.toDouble(),
      status: json['status'] == null
          ? null
          : Status.fromJson(json['status'] as Map<String, dynamic>),
      settled: json['settled'] as bool?,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'price': const StringToDoubleConverter().toJson(instance.price),
      'size': const StringToDoubleConverter().toJson(instance.size),
      'product_id': instance.productId,
      'profile_id': instance.profileId,
      'side': _$CoinbaseSideEnumMap[instance.side],
      'type': _$CoinbaseOrderTypeEnumMap[instance.type],
      'time_in_force': instance.timeInForce,
      'post_only': instance.postOnly,
      'created_at': instance.createdAt?.toIso8601String(),
      'fill_fees': instance.fillFees,
      'filled_size': instance.filledSize,
      'executed_value': instance.executedValue,
      'status': instance.status?.toJson(),
      'settled': instance.settled,
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

const _$CoinbaseOrderTypeEnumMap = {
  CoinbaseOrderType.limit: 'limit',
  CoinbaseOrderType.market: 'market',
  CoinbaseOrderType.stop: 'stop',
};
