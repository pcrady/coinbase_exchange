import 'package:coinbase_dart/src/lib/custom_json_converters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'parts/ticker.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Ticker {
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