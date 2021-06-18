import 'package:coinbase_dart/coinbase_dart.dart';
import 'package:coinbase_dart/src/lib/custom_json_converters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'match.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Match {
  final String? type;
  final int? tradeId;
  final int? sequence;
  final String? makerOrderId;
  final String? takerOrderId;
  final DateTime? time;
  final String? productId;
  @StringToDoubleConverter()
  final double? size;
  @StringToDoubleConverter()
  final double? price;
  final CoinbaseSide? side;
  final String? takerUserId;
  final String? userId;
  final String? takerProfileId;
  final String? profileId;
  @StringToDoubleConverter()
  final double? takerFeeRate;
  final String? makerUserId;
  final String? makerProfileId;
  @StringToDoubleConverter()
  final String? makerFeeRate;

  Match({
    this.type,
    this.tradeId,
    this.sequence,
    this.makerOrderId,
    this.takerOrderId,
    this.time,
    this.productId,
    this.size,
    this.price,
    this.side,
    this.takerUserId,
    this.userId,
    this.takerProfileId,
    this.profileId,
    this.takerFeeRate,
    this.makerUserId,
    this.makerProfileId,
    this.makerFeeRate,
  });

  factory Match.fromJson(Map<String, dynamic> json) => _$MatchFromJson(json);

  Map<String, dynamic> toJson() => _$MatchToJson(this);
}