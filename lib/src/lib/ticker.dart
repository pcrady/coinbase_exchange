import 'package:json_annotation/json_annotation.dart';

part '../part/ticker.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Ticker {
 final int? tradeId;
 final double? price;
 final double? size;
 final double? bid;
 final double? ask;
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