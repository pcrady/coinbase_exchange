import '../lib/custom_json_converters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ledger_entry.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class LedgerEntry {
  DateTime? createdAt;
  String? id;
  @StringToDoubleConverter()
  double? amount;
  @StringToDoubleConverter()
  double? balance;
  //TODO make type an enum
  String? type;
  //TODO make details a class
  Map<String, String>? details;

  LedgerEntry({
    this.createdAt,
    this.id,
    this.amount,
    this.balance,
    this.type,
    this.details,
  });



  factory LedgerEntry.fromJson(Map<String, dynamic> json) => _$LedgerEntryFromJson(json);

  Map<String, dynamic> toJson() => _$LedgerEntryToJson(this);
}