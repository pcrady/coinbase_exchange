import 'package:coinbase_exchange/src/models/picker_data_balance.dart';
import 'package:json_annotation/json_annotation.dart';

part 'payment_method_picker_data.g.dart';

/// An object which contains information about picker data
@JsonSerializable(fieldRename: FieldRename.snake)
class PaymentMethodPickerData {
  final String? symbol;
  final PickerDataBalance? balance;

  PaymentMethodPickerData({
    this.symbol,
    this.balance,
  });

  factory PaymentMethodPickerData.fromJson(Map<String, dynamic> json) =>
    _$PaymentMethodPickerDataFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentMethodPickerDataToJson(this);
}