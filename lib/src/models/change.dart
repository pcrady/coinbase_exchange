import 'package:coinbase_dart/coinbase_dart.dart';
import 'package:coinbase_dart/src/lib/custom_json_converters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'change.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Change {
  final String? type;
  final DateTime? time;
  final int? sequence;
  final String? orderId;
  final String? productId;
  @StringToDoubleConverter()
  final double? newSize;
  @StringToDoubleConverter()
  final double? oldSize;
  @StringToDoubleConverter()
  final double? newFunds;
  @StringToDoubleConverter()
  final double? oldFunds;
  @StringToDoubleConverter()
  final double? price;
  final CoinbaseSide? side;

  Change({
    this.type,
    this.time,
    this.sequence,
    this.orderId,
    this.productId,
    this.newSize,
    this.oldSize,
    this.newFunds,
    this.oldFunds,
    this.price,
    this.side
  });

  factory Change.fromJson(Map<String, dynamic> json) => _$ChangeFromJson(json);

  Map<String, dynamic> toJson() => _$ChangeToJson(this);
}