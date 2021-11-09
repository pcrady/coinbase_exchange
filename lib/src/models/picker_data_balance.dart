import 'package:coinbase_exchange/src/lib/custom_json_converters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'picker_data_balance.g.dart';

/// An object which contains information about picker data balance
@JsonSerializable(fieldRename: FieldRename.snake)
class PickerDataBalance {
  @StringToDoubleConverter()
  final double? amount;
  final String? currency;

  PickerDataBalance({
    this.amount,
    this.currency,
  });

  factory PickerDataBalance.fromJson(Map<String, dynamic> json) =>
    _$PickerDataBalanceFromJson(json);

  Map<String, dynamic> toJson() => _$PickerDataBalanceToJson(this);
}