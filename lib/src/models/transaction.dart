import '../lib/custom_json_converters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'transaction.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Transaction {
  String? id;
  @StringToDoubleConverter()
  double? amount;
  String? currency;
  @StringToDoubleConverter()
  String? payoutAt;
  @StringToDoubleConverter()
  double? fee;
  @StringToDoubleConverter()
  double? subtotal;

  Transaction({
    this.id,
    this.amount,
    this.currency,
    this.payoutAt,
    this.fee,
    this.subtotal,
  });

  factory Transaction.fromJson(Map<String, dynamic> json) =>
      _$TransactionFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionToJson(this);
}
