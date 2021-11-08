import 'package:coinbase_exchange/src/lib/coinbase_enums.dart';
import 'package:json_annotation/json_annotation.dart';
import '../lib/custom_json_converters.dart';

part 'fill.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Fill {
  final DateTime? createdAt;
  final int? tradeId;
  final String? productId;
  final String? userId;
  final String? profileId;
  final String? liquidity;
  @StringToDoubleConverter()
  final double? price;
  @StringToDoubleConverter()
  final double? size;
  @StringToDoubleConverter()
  final double? fee;
  final String? sell;
  final SideEnum? side;
  final bool? settled;
  @StringToDoubleConverter()
  final double? usdVolume;

  Fill({
    this.createdAt,
    this.tradeId,
    this.productId,
    this.userId,
    this.profileId,
    this.liquidity,
    this.price,
    this.size,
    this.fee,
    this.sell,
    this.side,
    this.settled,
    this.usdVolume,
  });

  factory Fill.fromJson(Map<String, dynamic> json) => _$FillFromJson(json);

  Map<String, dynamic> toJson() => _$FillToJson(this);
}
