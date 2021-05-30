import 'package:json_annotation/json_annotation.dart';

part '../part/product.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Product {
  final String? id;
  final String? displayName;
  final String? baseCurrency;
  final String? quoteCurrency;
  final double? baseIncrement;
  final double? quoteIncrement;
  final double? baseMinSize;
  final double? baseMaxSize;
  final double? minMarketFunds;
  final double? maxMarketFunds;
  final String? status;
  final String? statusMessage;
  final bool? cancelOnly;
  final bool? limitOnly;
  final bool? postOnly;
  final bool? tradingDisabled;

  Product({
    this.id,
    this.displayName,
    this.baseCurrency,
    this.quoteCurrency,
    this.baseIncrement,
    this.quoteIncrement,
    this.baseMinSize,
    this.baseMaxSize,
    this.minMarketFunds,
    this.maxMarketFunds,
    this.status,
    this.statusMessage,
    this.cancelOnly,
    this.limitOnly,
    this.postOnly,
    this.tradingDisabled,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}