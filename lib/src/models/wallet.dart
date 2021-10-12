import 'package:coinbase_exchange/src/lib/custom_json_converters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'wallet.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Wallet {
  final bool? availableOnConsumer;
  @StringToDoubleConverter()
  final double? holdBalance;
  final String? id;
  final String? holdCurrency;
  @StringToDoubleConverter()
  final double? balance;
  final String? currency;
  final bool? primary;
  final String? name;
  final String? type;
  final bool? active;

  Wallet({
    this.availableOnConsumer,
    this.holdBalance,
    this.id,
    this.holdCurrency,
    this.balance,
    this.currency,
    this.primary,
    this.name,
    this.type,
    this.active,
  });

  factory Wallet.fromJson(Map<String, dynamic> json) => _$WalletFromJson(json);

  Map<String, dynamic> toJson() => _$WalletToJson(this);
}