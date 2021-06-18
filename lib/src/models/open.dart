import 'package:coinbase_dart/src/lib/coinbase_enums.dart';
import 'package:coinbase_dart/src/lib/custom_json_converters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'open.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Open {
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