// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'done.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Done _$DoneFromJson(Map<String, dynamic> json) => Done(
      type: json['type'] as String?,
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
      productId: json['product_id'] as String?,
      sequence: json['sequence'] as int?,
      orderId: json['order_id'] as String?,
      price: const StringToDoubleConverter().fromJson(json['price'] as String?),
      remainingSize: const StringToDoubleConverter()
          .fromJson(json['remaining_size'] as String?),
      side: _$enumDecodeNullable(_$CoinbaseSideEnumMap, json['side']),
      reason: _$enumDecodeNullable(_$CoinbaseReasonEnumMap, json['reason']),
    );

Map<String, dynamic> _$DoneToJson(Done instance) => <String, dynamic>{
      'type': instance.type,
      'time': instance.time?.toIso8601String(),
      'product_id': instance.productId,
      'sequence': instance.sequence,
      'order_id': instance.orderId,
      'price': const StringToDoubleConverter().toJson(instance.price),
      'remaining_size':
          const StringToDoubleConverter().toJson(instance.remainingSize),
      'side': _$CoinbaseSideEnumMap[instance.side],
      'reason': _$CoinbaseReasonEnumMap[instance.reason],
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

const _$CoinbaseReasonEnumMap = {
  CoinbaseReason.filled: 'filled',
  CoinbaseReason.canceled: 'canceled',
};
