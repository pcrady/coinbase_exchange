import 'package:json_annotation/json_annotation.dart';

part 'parts/order_book.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class OrderBook {
  final int? sequence;
  final List<List?>? bids;
  final List<List?>? asks;

  OrderBook({
    this.sequence,
    this.bids,
    this.asks
  });

  factory OrderBook.fromJson(Map<String, dynamic> json) => _$OrderBookFromJson(json);

  Map<String, dynamic> toJson() => _$OrderBookToJson(this);
}