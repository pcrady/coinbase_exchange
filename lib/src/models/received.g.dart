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
      side: $enumDecodeNullable(_$SideEnumEnumMap, json['side']),
      orderType: $enumDecodeNullable(_$OrderEnumEnumMap, json['order_type']),
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

const _$SideEnumEnumMap = {
  SideEnum.buy: 'buy',
  SideEnum.sell: 'sell',
};

const _$OrderEnumEnumMap = {
  OrderEnum.limit: 'limit',
  OrderEnum.market: 'market',
  OrderEnum.stop: 'stop',
};
