import 'package:coinbase_exchange/coinbase_exchange.dart';

import '../lib/websocket_response.dart';
import '../lib/custom_json_converters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'stream_ticker.g.dart';

/// A ticker returned by the [WebsocketClient] which provides
/// real-time price updates every time a match happens.
///
/// https://docs.cloud.coinbase.com/exchange/docs/channels#the-level2-channel
@JsonSerializable(fieldRename: FieldRename.snake)
class StreamTicker extends WebsocketResponse {
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

  factory StreamTicker.fromJson(Map<String, dynamic> json) =>
      _$StreamTickerFromJson(json);

  Map<String, dynamic> toJson() => _$StreamTickerToJson(this);
}
