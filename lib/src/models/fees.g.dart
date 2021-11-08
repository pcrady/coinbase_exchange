// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'fees.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Fees _$FeesFromJson(Map<String, dynamic> json) => Fees(
      makerFeeRate: const StringToDoubleConverter()
          .fromJson(json['maker_fee_rate'] as String?),
      takerFeeRate: const StringToDoubleConverter()
          .fromJson(json['taker_fee_rate'] as String?),
      usdVolume: const StringToDoubleConverter()
          .fromJson(json['usd_volume'] as String?),
    );

Map<String, dynamic> _$FeesToJson(Fees instance) => <String, dynamic>{
      'maker_fee_rate':
          const StringToDoubleConverter().toJson(instance.makerFeeRate),
      'taker_fee_rate':
          const StringToDoubleConverter().toJson(instance.takerFeeRate),
      'usd_volume': const StringToDoubleConverter().toJson(instance.usdVolume),
    };
