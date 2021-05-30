// GENERATED CODE - DO NOT MODIFY BY HAND

part of '../lib/stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stats _$StatsFromJson(Map<String, dynamic> json) {
  return Stats(
    open: (json['open'] as num?)?.toDouble(),
    high: (json['high'] as num?)?.toDouble(),
    low: (json['low'] as num?)?.toDouble(),
    volume: (json['volume'] as num?)?.toDouble(),
    volume30Day: (json['volume_30day'] as num?)?.toDouble(),
  );
}

Map<String, dynamic> _$StatsToJson(Stats instance) => <String, dynamic>{
      'open': instance.open,
      'high': instance.high,
      'low': instance.low,
      'volume': instance.volume,
      'volume_30day': instance.volume30Day,
    };
