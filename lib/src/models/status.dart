import 'package:coinbase_exchange/coinbase_exchange.dart';

import '../lib/websocket_response.dart';
import '../models/currency.dart';
import '../models/product.dart';
import 'package:json_annotation/json_annotation.dart';

part 'status.g.dart';

/// An object returned by the [WebsocketClient] which reflects
/// all products and currencies on a preset interval.
///
/// https://docs.cloud.coinbase.com/exchange/docs/channels#the-level2-channel
@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Status extends WebsocketResponse {
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
