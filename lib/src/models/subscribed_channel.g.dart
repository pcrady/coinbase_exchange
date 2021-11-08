// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscribed_channel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SubscribedChannel _$SubscribedChannelFromJson(Map<String, dynamic> json) =>
    SubscribedChannel(
      name: json['name'] as String?,
      productIds: (json['product_ids'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SubscribedChannelToJson(SubscribedChannel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'product_ids': instance.productIds,
    };
