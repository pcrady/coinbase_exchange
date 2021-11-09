import '../lib/custom_json_converters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'ledger_entry_details.g.dart';

/// An entry in the ledger of an account.
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class LedgerEntryDetails {
  final String? to;
  final String? from;
  final String? profileTransferId;

  LedgerEntryDetails({
    this.to,
    this.from,
    this.profileTransferId,
  });

  factory LedgerEntryDetails.fromJson(Map<String, dynamic> json) =>
      _$LedgerEntryDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$LedgerEntryDetailsToJson(this);
}
