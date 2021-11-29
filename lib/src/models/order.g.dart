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
      side: $enumDecodeNullable(_$SideEnumEnumMap, json['side']),
      type: $enumDecodeNullable(_$OrderEnumEnumMap, json['type']),
      timeInForce: json['time_in_force'] as String?,
      postOnly: json['post_only'] as bool?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      fillFees: const StringToDoubleConverter()
          .fromJson(json['fill_fees'] as String?),
      filledSize: const StringToDoubleConverter()
          .fromJson(json['filled_size'] as String?),
      executedValue: const StringToDoubleConverter()
          .fromJson(json['executed_value'] as String?),
      status: $enumDecodeNullable(_$StatusEnumEnumMap, json['status']),
      settled: json['settled'] as bool?,
    );

Map<String, dynamic> _$OrderToJson(Order instance) => <String, dynamic>{
      'id': instance.id,
      'price': const StringToDoubleConverter().toJson(instance.price),
      'size': const StringToDoubleConverter().toJson(instance.size),
      'product_id': instance.productId,
      'profile_id': instance.profileId,
      'side': _$SideEnumEnumMap[instance.side],
      'type': _$OrderEnumEnumMap[instance.type],
      'time_in_force': instance.timeInForce,
      'post_only': instance.postOnly,
      'created_at': instance.createdAt?.toIso8601String(),
      'fill_fees': const StringToDoubleConverter().toJson(instance.fillFees),
      'filled_size':
          const StringToDoubleConverter().toJson(instance.filledSize),
      'executed_value':
          const StringToDoubleConverter().toJson(instance.executedValue),
      'status': _$StatusEnumEnumMap[instance.status],
      'settled': instance.settled,
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

const _$StatusEnumEnumMap = {
  StatusEnum.open: 'open',
  StatusEnum.pending: 'pending',
  StatusEnum.rejected: 'rejected',
  StatusEnum.done: 'done',
  StatusEnum.active: 'active',
  StatusEnum.received: 'received',
  StatusEnum.all: 'all',
};
