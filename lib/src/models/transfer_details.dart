import 'package:json_annotation/json_annotation.dart';

part 'transfer_details.g.dart';

/// A transfer object
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class TransferDetails {
  final String? coinbaseAccountId;
  final String? coinbaseTransactionId;
  final String? coinbasePaymentMethodId;

  TransferDetails({
    this.coinbaseAccountId,
    this.coinbaseTransactionId,
    this.coinbasePaymentMethodId,
  });

  factory TransferDetails.fromJson(Map<String, dynamic> json) =>
      _$TransferDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$TransferDetailsToJson(this);
}
