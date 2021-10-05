import 'package:coinbase_dart/coinbase_dart.dart';
import 'package:coinbase_dart/src/lib/custom_json_converters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transfer.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Transfer {
  String? id;
  CoinbaseTransferType? type;
  DateTime? createdAt;
  DateTime? completedAt;
  DateTime? canceledAt;
  DateTime? processedAt;
  String? userNonce;
  @StringToDoubleConverter()
  double? amount;
  Map? details;

  Transfer({
    this.id,
    this.type,
    this.createdAt,
    this.completedAt,
    this.canceledAt,
    this.processedAt,
    this.userNonce,
    this.amount,
    this.details,
  });

  factory Transfer.fromJson(Map<String, dynamic> json) => _$TransferFromJson(json);

  Map<String, dynamic> toJson() => _$TransferToJson(this);
}