import '../lib/coinbase_enums.dart';
import '../lib/custom_json_converters.dart';
import '../models/status.dart';
import 'package:json_annotation/json_annotation.dart';

part 'order.g.dart';

/// An an object which contains information about an order.
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Order {
  final String? id;
  @StringToDoubleConverter()
  final double? price;
  @StringToDoubleConverter()
  final double? size;
  final String? productId;
  final String? profileId;
  final SideEnum? side;
  final OrderEnum? type;
  final String? timeInForce;
  final bool? postOnly;
  final DateTime? createdAt;
  @StringToDoubleConverter()
  final double? fillFees;
  @StringToDoubleConverter()
  final double? filledSize;
  @StringToDoubleConverter()
  final double? executedValue;
  final StatusEnum? status;
  final bool? settled;

  Order({
    this.id,
    this.price,
    this.size,
    this.productId,
    this.profileId,
    this.side,
    this.type,
    this.timeInForce,
    this.postOnly,
    this.createdAt,
    this.fillFees,
    this.filledSize,
    this.executedValue,
    this.status,
    this.settled,
  });

  factory Order.fromJson(Map<String, dynamic> json) => _$OrderFromJson(json);

  Map<String, dynamic> toJson() => _$OrderToJson(this);
}
