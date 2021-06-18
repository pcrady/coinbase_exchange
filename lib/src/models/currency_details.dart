import 'package:coinbase_dart/src/lib/custom_json_converters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'parts/currency_details.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class CurrencyDetails {
  final String? type;
  final String? symbol;
  final int? networkConfirmations;
  final int? sortOrder;
  final String? cryptoAddressLink;
  final String? cryptoTransactionLink;
  final List<String>? pushPaymentMethods;
  final List<String>? groupTypes;
  final String? displayName;
  final int? processingTimeSeconds;
  final double? minWithdrawalAmount;

  CurrencyDetails({
    this.type,
    this.symbol,
    this.networkConfirmations,
    this.sortOrder,
    this.cryptoAddressLink,
    this.cryptoTransactionLink,
    this.pushPaymentMethods,
    this.groupTypes,
    this.displayName,
    this.processingTimeSeconds,
    this.minWithdrawalAmount,
  });

  factory CurrencyDetails.fromJson(Map<String, dynamic> json) => _$CurrencyDetailsFromJson(json);

  Map<String, dynamic> toJson() => _$CurrencyDetailsToJson(this);
}