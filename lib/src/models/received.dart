import 'package:coinbase_exchange/coinbase_exchange.dart';
import 'package:coinbase_exchange/src/lib/custom_json_converters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'received.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Received {
  final String? type;
  final DateTime? time;
  final String? productId;
  final int? sequence;
  final String? orderId;
  @StringToDoubleConverter()
  final double? funds;
  final CoinbaseSide? side;
  final CoinbaseOrderType? orderType;

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

  factory Received.fromJson(Map<String, dynamic> json) => _$ReceivedFromJson(json);

  Map<String, dynamic> toJson() => _$ReceivedToJson(this);
}