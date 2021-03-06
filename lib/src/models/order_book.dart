import 'package:json_annotation/json_annotation.dart';

part 'order_book.g.dart';

/// The order book for a product.
@JsonSerializable(fieldRename: FieldRename.snake)
class OrderBook {
  final int? sequence;
  final List<List?>? bids;
  final List<List?>? asks;

  OrderBook({this.sequence, this.bids, this.asks});

  factory OrderBook.fromJson(Map<String, dynamic> json) =>
      _$OrderBookFromJson(json);

  Map<String, dynamic> toJson() => _$OrderBookToJson(this);
}
