import '../lib/custom_json_converters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'account.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Account {
  String? id;
  String? currency;
  @StringToDoubleConverter()
  double? balance;
  @StringToDoubleConverter()
  double? available;
  @StringToDoubleConverter()
  double? hold;
  bool? tradingEnabled;

  Account({
    this.id,
    this.currency,
    this.balance,
    this.available,
    this.hold,
    this.tradingEnabled,
  });

  factory Account.fromJson(Map<String, dynamic> json) =>
      _$AccountFromJson(json);

  Map<String, dynamic> toJson() => _$AccountToJson(this);
}
