import '../lib/custom_json_converters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ticker.g.dart';

/// A snapshot information about the last trade (tick), best bid/ask and 24h volume.
@JsonSerializable(fieldRename: FieldRename.snake)
class Ticker {
  final String? type;
  final int? tradeId;
  @StringToDoubleConverter()
  final double? price;
  @StringToDoubleConverter()
  final double? size;
  @StringToDoubleConverter()
  final double? bid;
  @StringToDoubleConverter()
  final double? ask;
  @StringToDoubleConverter()
  final double? volume;
  final DateTime? time;

  Ticker({
    this.type,
    this.tradeId,
    this.price,
    this.size,
    this.bid,
    this.ask,
    this.volume,
    this.time,
  });

  factory Ticker.fromJson(Map<String, dynamic> json) => _$TickerFromJson(json);

  Map<String, dynamic> toJson() => _$TickerToJson(this);
}
