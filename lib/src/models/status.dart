import '../models/currency.dart';
import '../models/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'status.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Status {
  final String? type;
  final List<Product?>? products;
  final List<Currency?>? currencies;

  Status({
    this.type,
    this.currencies,
    this.products,
  });

  factory Status.fromJson(Map<String, dynamic> json) => _$StatusFromJson(json);

  Map<String, dynamic> toJson() => _$StatusToJson(this);
}
