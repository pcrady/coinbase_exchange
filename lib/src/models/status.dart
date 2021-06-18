import 'package:coinbase_dart/src/models/currency.dart';
import 'package:coinbase_dart/src/models/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'status.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Status {
  final List<Product?>? products;
  final List<Currency?>? currencies;

  Status({
    this.currencies,
    this.products,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}