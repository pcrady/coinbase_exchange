import 'package:json_annotation/json_annotation.dart';
import 'package:coinbase_exchange/coinbase_exchange.dart';
import '../lib/custom_json_converters.dart';
import '../lib/websocket_response.dart';

part 'done.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Done extends WebsocketResponse {
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
  final ReasonEnum? reason;

  Done({
    this.type,
    this.time,
    this.productId,
    this.sequence,
    this.orderId,
    this.price,
    this.remainingSize,
    this.side,
    this.reason,
  });

  factory Done.fromJson(Map<String, dynamic> json) => _$DoneFromJson(json);

  Map<String, dynamic> toJson() => _$DoneToJson(this);
}
