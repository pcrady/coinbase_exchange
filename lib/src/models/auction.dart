import 'package:coinbase_exchange/src/lib/custom_json_converters.dart';

import '../lib/websocket_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'auction.g.dart';

/// The auction channel will send information about the auction while
/// the product is in auction mode.
///
/// https://docs.cloud.coinbase.com/exchange/docs/channels#auction
@JsonSerializable(fieldRename: FieldRename.snake)
class Auction extends WebsocketResponse {
  final String? type;
  final String? productId;
  final int? sequence;
  final String? auctionState;
  @StringToDoubleConverter()
  final double? bestBidPrice;
  @StringToDoubleConverter()
  final double? bestBidSize;
  @StringToDoubleConverter()
  final double? bestAskPrice;
  @StringToDoubleConverter()
  final double? bestAskSize;
  @StringToDoubleConverter()
  final double? openPrice;
  @StringToDoubleConverter()
  final double? openSize;
  final String? canOpen;
  final DateTime? timestamp;

  Auction({
    this.type,
    this.productId,
    this.sequence,
    this.auctionState,
    this.bestBidPrice,
    this.bestBidSize,
    this.bestAskPrice,
    this.bestAskSize,
    this.openPrice,
    this.openSize,
    this.canOpen,
    this.timestamp,
  });

  factory Auction.fromJson(Map<String, dynamic> json) =>
    _$AuctionFromJson(json);

  Map<String, dynamic> toJson() => _$AuctionToJson(this);
}