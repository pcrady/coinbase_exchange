import 'package:coinbase_exchange/coinbase_exchange.dart';
import '../lib/custom_json_converters.dart';
import 'package:json_annotation/json_annotation.dart';
import '../lib/websocket_response.dart';

part 'activate.g.dart';

/// An object returned by the [WebsocketClient] which is returned when
/// a stop order is placed.
///
/// https://docs.cloud.coinbase.com/exchange/docs/channels#activate
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Activate extends WebsocketResponse {
  final String? type;
  final String? productId;
  final DateTime? timestamp;
  @StringToDoubleConverter()
  final double? userId;
  @StringToDoubleConverter()
  final double? profileId;
  final String? orderId;
  final String? stopType;
  final SideEnum? side;
  @StringToDoubleConverter()
  final double? stopPrice;
  @StringToDoubleConverter()
  final double? size;
  @StringToDoubleConverter()
  final double? funds;
  final bool? private;

  Activate({
    this.type,
    this.productId,
    this.timestamp,
    this.userId,
    this.profileId,
    this.orderId,
    this.stopType,
    this.side,
    this.stopPrice,
    this.size,
    this.funds,
    this.private,
  });

  factory Activate.fromJson(Map<String, dynamic> json) =>
      _$ActivateFromJson(json);

  Map<String, dynamic> toJson() => _$ActivateToJson(this);
}
