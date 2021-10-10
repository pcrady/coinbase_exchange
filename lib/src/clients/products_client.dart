import 'dart:html';

import 'package:coinbase_dart/coinbase_dart.dart';
import 'package:coinbase_dart/src/clients/client.dart';
import 'package:coinbase_dart/src/lib/paginator.dart';
import 'package:coinbase_dart/src/rest_clients/products_rest_client.dart';
import 'package:logger/logger.dart';
import 'dart:convert';

class ProductsClient extends Client {
  Logger _logger = Logger();
  bool sandbox;
  String apiKey;
  String secretKey;
  String passphrase;
  late ProductsRestClient _productsRestClient;

  ProductsClient({
    this.sandbox = false,
    required this.apiKey,
    required this.secretKey,
    required this.passphrase,
  }) {
    _productsRestClient = ProductsRestClient(
      sandbox: sandbox,
      apiKey: apiKey,
      secretKey: secretKey,
      passphrase: passphrase,
    );
  }

  /// Get all known trading pairs
  ///
  /// Gets a list of available currency pairs for trading.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getproducts
  ///
  Future<List<Product>> getAllTradingPairs() async {
    var response = await _productsRestClient.getAllTradingPairs();

    if (response.statusCode != 200) throw response;

    return listDecode(response.body).map((product) => Product.fromJson(product)).toList();
  }

  /// Get single product
  ///
  /// Get information on a single product.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getproduct
  ///
  Future<Product> getProduct({
    required String productId,
  }) async {
    var response = await _productsRestClient.getProduct(productId: productId);

    if (response.statusCode != 200) throw response;

    return Product.fromJson(json.decode(response.body));
  }

  /// Get product book
  ///
  /// Get a list of open orders for a product. The
  /// amount of detail shown can be customized with the level parameter.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getproductbook
  ///
  Future<OrderBook> getProductBook({
    required String productId,
    CoinbaseLevel? level,
  }) async {
    var response = await _productsRestClient.getProductBook(
      productId: productId,
      level: level,
    );

    if (response.statusCode != 200) throw response;

    return OrderBook.fromJson(json.decode(response.body));
  }

  /// Get product candles
  ///
  /// Historic rates for a product. Rates are returned in grouped buckets.
  /// Candle schema is of the form [\timestamp, price_low, price_high,
  /// price_open, price_close]
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getproductcandles
  ///
  Future<List<Candle>> getProductCandles({
    required String productId,
    CoinbaseGranularity? granularity,
    DateTime? start,
    DateTime? end,
  }) async {
    var response = await _productsRestClient.getProductCandles(
      productId: productId,
      granularity: granularity,
      start: start,
      end: end,
    );

    if (response.statusCode != 200) throw response;

    List<List> body = List<List>.from(json.decode(response.body));
    return body.map((candle) => Candle.fromList(candle)).toList();

  }

  /// Get product stats
  ///
  /// Gets 30day and 24hour stats for a product.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getproductstats
  ///
  Future<Map<String, Stats>> getProductStats({
    required String productId,
  }) async {
    var response = await _productsRestClient.getProductStats(productId: productId);

    if (response.statusCode != 200) throw response;

    var body = json.decode(response.body);
    return body.map((String key, value) {
      return MapEntry(key, Stats.fromJson(value));
    });
  }

  /// Get product ticker
  ///
  /// Gets snapshot information about the last trade (tick), best bid/ask and 24h volume.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getproductticker
  ///
  Future<Ticker> getProductTicker({
    required String productId,
  }) async {
    var response = await _productsRestClient.getProductTicker(productId: productId);

    if (response.statusCode != 200) throw response;

    return Ticker.fromJson(json.decode(response.body));
  }
  /// Get product trades
  ///
  /// Gets a list the latest trades for a product.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getproducttrades
  Future<Paginator<Trade, DateTime>> getProductTrades({
    required String productId,
    int? limit,
    int? before,
    int? after,
  }) async {
    var response = await _productsRestClient.getProductTrades(
      productId: productId,
      limit: limit,
      before: before,
      after: after,
    );

    if (response.statusCode != 200) throw response;

    return Paginator(
      before: response.headers.containsKey('CB-BEFORE') ? DateTime.parse(response.headers['CB-BEFORE']!) : null,
      after: response.headers.containsKey('CB-AFTER') ? DateTime.parse(response.headers['CB-AFTER']!) : null,
      elements: listDecode(response.body).map((trade) => Trade.fromJson(trade)).toList(),
    );
  }
}