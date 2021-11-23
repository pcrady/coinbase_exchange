// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'open.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Open _$OpenFromJson(Map<String, dynamic> json) => Open(
      type: json['type'] as String?,
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
      productId: json['product_id'] as String?,
      sequence: json['sequence'] as int?,
      orderId: json['order_id'] as String?,
      price: const StringToDoubleConverter().fromJson(json['price'] as String?),
      remainingSize: const StringToDoubleConverter()
          .fromJson(json['remaining_size'] as String?),
      side: $enumDecodeNullable(_$SideEnumEnumMap, json['side']),
    );

Map<String, dynamic> _$OpenToJson(Open instance) => <String, dynamic>{
      'type': instance.type,
      'time': instance.time?.toIso8601String(),
      'product_id': instance.productId,
      'sequence': instance.sequence,
      'order_id': instance.orderId,
      'price': const StringToDoubleConverter().toJson(instance.price),
      'remaining_size':
          const StringToDoubleConverter().toJson(instance.remainingSize),
      'side': _$SideEnumEnumMap[instance.side],
    };

const _$SideEnumEnumMap = {
  SideEnum.buy: 'buy',
  SideEnum.sell: 'sell',
};
