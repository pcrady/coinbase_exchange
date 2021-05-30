import 'package:coinbase_dart/src/coinbase_enums.dart';
import 'package:json_annotation/json_annotation.dart';

part '../part/trade.g.dart';



@JsonSerializable(fieldRename: FieldRename.snake)
class Trade {
  final DateTime? time;
  final int? tradeId;
  final double? price;
  final double? size;
  final Side? side;

  Trade({
    this.time,
    this.tradeId,
    this.price,
    this.size,
    this.side,
  });

  factory Trade.fromJson(Map<String, dynamic> json) => _$TradeFromJson(json);

  Map<String, dynamic> toJson() => _$TradeToJson(this);
}