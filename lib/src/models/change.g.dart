// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'change.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Change _$ChangeFromJson(Map<String, dynamic> json) => Change(
      type: json['type'] as String?,
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
      sequence: json['sequence'] as int?,
      orderId: json['order_id'] as String?,
      productId: json['product_id'] as String?,
      newSize:
          const StringToDoubleConverter().fromJson(json['new_size'] as String?),
      oldSize:
          const StringToDoubleConverter().fromJson(json['old_size'] as String?),
      newFunds: const StringToDoubleConverter()
          .fromJson(json['new_funds'] as String?),
      oldFunds: const StringToDoubleConverter()
          .fromJson(json['old_funds'] as String?),
      price: const StringToDoubleConverter().fromJson(json['price'] as String?),
      side: $enumDecodeNullable(_$SideEnumEnumMap, json['side']),
    );

Map<String, dynamic> _$ChangeToJson(Change instance) => <String, dynamic>{
      'type': instance.type,
      'time': instance.time?.toIso8601String(),
      'sequence': instance.sequence,
      'order_id': instance.orderId,
      'product_id': instance.productId,
      'new_size': const StringToDoubleConverter().toJson(instance.newSize),
      'old_size': const StringToDoubleConverter().toJson(instance.oldSize),
      'new_funds': const StringToDoubleConverter().toJson(instance.newFunds),
      'old_funds': const StringToDoubleConverter().toJson(instance.oldFunds),
      'price': const StringToDoubleConverter().toJson(instance.price),
      'side': _$SideEnumEnumMap[instance.side],
    };

const _$SideEnumEnumMap = {
  SideEnum.buy: 'buy',
  SideEnum.sell: 'sell',
};
