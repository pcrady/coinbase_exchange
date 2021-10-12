import '../lib/coinbase_enums.dart';
import '../lib/custom_json_converters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'trade.g.dart';



@JsonSerializable(fieldRename: FieldRename.snake)
class Trade {
  final DateTime? time;
  final int? tradeId;
  @StringToDoubleConverter()
  final double? price;
  @StringToDoubleConverter()
  final double? size;
  final CoinbaseSide? side;

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