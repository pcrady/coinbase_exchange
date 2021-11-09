import 'package:coinbase_exchange/coinbase_exchange.dart';
import '../lib/custom_json_converters.dart';
import '../lib/websocket_response.dart';
import 'package:json_annotation/json_annotation.dart';

part 'received.g.dart';

/// An object returned by the [WebsocketClient] that indicates a
/// valid order has been received and is now active.
///
/// https://docs.cloud.coinbase.com/exchange/docs/channels#received
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Received extends WebsocketResponse {
  final String? type;
  final DateTime? time;
  final String? productId;
  final int? sequence;
  final String? orderId;
  @StringToDoubleConverter()
  final double? funds;
  final SideEnum? side;
  final OrderEnum? orderType;

  Received({
    this.type,
    this.time,
    this.productId,
    this.sequence,
    this.orderId,
    this.funds,
    this.side,
    this.orderType,
  });

  factory Received.fromJson(Map<String, dynamic> json) =>
      _$ReceivedFromJson(json);

  Map<String, dynamic> toJson() => _$ReceivedToJson(this);
}
