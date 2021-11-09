import 'package:coinbase_exchange/coinbase_exchange.dart';

import '../lib/coinbase_enums.dart';
import '../lib/custom_json_converters.dart';
import '../lib/websocket_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'open.g.dart';

/// An object returned by the [WebsocketClient] which indicates that
/// the order is now open on the order book.
///
/// https://docs.cloud.coinbase.com/exchange/docs/channels#open
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Open extends WebsocketResponse {
  final String? type;
  final DateTime? time;
  final String? productId;
  final int? sequence;
  final String? orderId;
  @StringToDoubleConverter()
  final double? price;
  @StringToDoubleConverter()
  final double? remainingSize;
  final SideEnum? side;

  Open({
    this.type,
    this.time,
    this.productId,
    this.sequence,
    this.orderId,
    this.price,
    this.remainingSize,
    this.side,
  });

  factory Open.fromJson(Map<String, dynamic> json) => _$OpenFromJson(json);

  Map<String, dynamic> toJson() => _$OpenToJson(this);
}
