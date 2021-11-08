// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activate.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Activate _$ActivateFromJson(Map<String, dynamic> json) => Activate(
      type: json['type'] as String?,
      productId: json['product_id'] as String?,
      timestamp: json['timestamp'] == null
          ? null
          : DateTime.parse(json['timestamp'] as String),
      userId:
          const StringToDoubleConverter().fromJson(json['user_id'] as String?),
      profileId: const StringToDoubleConverter()
          .fromJson(json['profile_id'] as String?),
      orderId: json['order_id'] as String?,
      stopType: json['stop_type'] as String?,
      side: _$enumDecodeNullable(_$CoinbaseSideEnumMap, json['side']),
      stopPrice: const StringToDoubleConverter()
          .fromJson(json['stop_price'] as String?),
      size: const StringToDoubleConverter().fromJson(json['size'] as String?),
      funds: const StringToDoubleConverter().fromJson(json['funds'] as String?),
      private: json['private'] as bool?,
    );

Map<String, dynamic> _$ActivateToJson(Activate instance) => <String, dynamic>{
      'type': instance.type,
      'product_id': instance.productId,
      'timestamp': instance.timestamp?.toIso8601String(),
      'user_id': const StringToDoubleConverter().toJson(instance.userId),
      'profile_id': const StringToDoubleConverter().toJson(instance.profileId),
      'order_id': instance.orderId,
      'stop_type': instance.stopType,
      'side': _$CoinbaseSideEnumMap[instance.side],
      'stop_price': const StringToDoubleConverter().toJson(instance.stopPrice),
      'size': const StringToDoubleConverter().toJson(instance.size),
      'funds': const StringToDoubleConverter().toJson(instance.funds),
      'private': instance.private,
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
