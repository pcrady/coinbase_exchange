// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stats.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Stats _$StatsFromJson(Map<String, dynamic> json) => Stats(
      open: const StringToDoubleConverter().fromJson(json['open'] as String?),
      high: const StringToDoubleConverter().fromJson(json['high'] as String?),
      low: const StringToDoubleConverter().fromJson(json['low'] as String?),
      volume:
          const StringToDoubleConverter().fromJson(json['volume'] as String?),
      volume30Day: const StringToDoubleConverter()
          .fromJson(json['volume_30day'] as String?),
    );

Map<String, dynamic> _$StatsToJson(Stats instance) => <String, dynamic>{
      'open': const StringToDoubleConverter().toJson(instance.open),
      'high': const StringToDoubleConverter().toJson(instance.high),
      'low': const StringToDoubleConverter().toJson(instance.low),
      'volume': const StringToDoubleConverter().toJson(instance.volume),
      'volume_30day':
          const StringToDoubleConverter().toJson(instance.volume30Day),
    };
