// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heartbeat.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Heartbeat _$HeartbeatFromJson(Map<String, dynamic> json) => Heartbeat(
      type: json['type'] as String?,
      sequence: json['sequence'] as int?,
      lastTradeId: json['last_trade_id'] as int?,
      productId: json['product_id'] as String?,
      time:
          json['time'] == null ? null : DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$HeartbeatToJson(Heartbeat instance) => <String, dynamic>{
      'type': instance.type,
      'sequence': instance.sequence,
      'last_trade_id': instance.lastTradeId,
      'product_id': instance.productId,
      'time': instance.time?.toIso8601String(),
    };
