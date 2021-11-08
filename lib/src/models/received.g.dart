// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'received.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Received _$ReceivedFromJson(Map<String, dynamic> json) => Received(
      type: json['type'] as String?,
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
      productId: json['product_id'] as String?,
      sequence: json['sequence'] as int?,
      orderId: json['order_id'] as String?,
      funds: const StringToDoubleConverter().fromJson(json['funds'] as String?),
      side: _$enumDecodeNullable(_$SideEnumEnumMap, json['side']),
      orderType: _$enumDecodeNullable(_$OrderEnumEnumMap, json['order_type']),
    );

Map<String, dynamic> _$ReceivedToJson(Received instance) => <String, dynamic>{
      'type': instance.type,
      'time': instance.time?.toIso8601String(),
      'product_id': instance.productId,
      'sequence': instance.sequence,
      'order_id': instance.orderId,
      'funds': const StringToDoubleConverter().toJson(instance.funds),
      'side': _$SideEnumEnumMap[instance.side],
      'order_type': _$OrderEnumEnumMap[instance.orderType],
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

const _$OrderEnumEnumMap = {
  OrderEnum.limit: 'limit',
  OrderEnum.market: 'market',
  OrderEnum.stop: 'stop',
};
