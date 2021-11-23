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
      side: $enumDecodeNullable(_$SideEnumEnumMap, json['side']),
      reason: $enumDecodeNullable(_$ReasonEnumEnumMap, json['reason']),
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
      'side': _$SideEnumEnumMap[instance.side],
      'reason': _$ReasonEnumEnumMap[instance.reason],
    };

const _$SideEnumEnumMap = {
  SideEnum.buy: 'buy',
  SideEnum.sell: 'sell',
};

const _$ReasonEnumEnumMap = {
  ReasonEnum.filled: 'filled',
  ReasonEnum.canceled: 'canceled',
};
