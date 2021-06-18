import 'package:coinbase_dart/src/lib/custom_json_converters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'parts/stream_ticker.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class StreamTicker {
  final int? tradeId;
  final int? sequence;
  final DateTime? time;
  final String? productId;
  @StringToDoubleConverter()
  final double? price;
  final String? side;
  @StringToDoubleConverter()
  final double? lastSize;
  @StringToDoubleConverter()
  final double? bestBid;
  @StringToDoubleConverter()
  final double? bestAsk;


  StreamTicker({
    this.tradeId,
    this.sequence,
    this.price,
    this.time,
    this.productId,
    this.side,
    this.lastSize,
    this.bestAsk,
    this.bestBid,
  });

  factory StreamTicker.fromJson(Map<String, dynamic> json) => _$StreamTickerFromJson(json);

  Map<String, dynamic> toJson() => _$StreamTickerToJson(this);
}