import 'package:json_annotation/json_annotation.dart';
import 'package:coinbase_dart/coinbase_dart.dart';
import 'package:coinbase_dart/src/lib/custom_json_converters.dart';

part 'done.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Done {
  final String? type;
  final DateTime? time;
  final String? productId;
  final int? sequence;
  final String? orderId;
  @StringToDoubleConverter()
  final double? price;
  @StringToDoubleConverter()
  final double? remainingSize;
  final CoinbaseSide? side;
  final CoinbaseReason? reason;

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