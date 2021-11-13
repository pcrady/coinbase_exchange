import 'package:coinbase_exchange/coinbase_exchange.dart';
import '../rest_clients/rest_client.dart';
import 'package:http/http.dart' as http;

/// A [RestClient] that helps manage products and returns http.Response
/// objects
class ProductsRestClient extends RestClient {
  ProductsRestClient({
    bool sandbox = false,
    required String apiKey,
    required String secretKey,
    required String passphrase,
  }) : super(
          sandbox: sandbox,
          apiKey: apiKey,
          secretKey: secretKey,
          passphrase: passphrase,
        );

  /// Get all known trading pairs
  ///
  /// Gets a list of available currency pairs for trading.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getproducts
  ///
  Future<http.Response> getAllTradingPairs() async => get(path: '/products');

  /// Get single product
  ///
  /// Get information on a single product.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getproduct
  ///
  Future<http.Response> getProduct({
    required String productId,
  }) async =>
      get(path: '/products/$productId');

  /// Not a documented endpoint but returns pricing data for
  /// all trading pairs at that point in time
  ///
  /// {
  ///    "ETH-BTC":{
  ///       "stats_30day":{
  ///          "volume":"311024.55212641"
  ///       },
  ///       "stats_24hour":{
  ///          "open":"0.0723",
  ///          "high":"0.07455",
  ///          "low":"0.07163",
  ///          "volume":"62.43255831",
  ///          "last":"0.0726"
  ///       }
  ///    },
  /// }
  Future<http.Response> getProductsStats() async =>
      get(path: '/products/stats');

  /// Get product book
  ///
  /// Get a list of open orders for a product. The
  /// amount of detail shown can be customized with the level parameter.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getproductbook
  ///
  Future<http.Response> getProductBook({
    required String productId,
    LevelEnum? level,
  }) async {
    Map<String, dynamic> queryParameters = {};
    if (level != null) queryParameters['level'] = level.value();

    return get(
      path: '/products/$productId/book',
      queryParameters: queryParameters,
    );
  }

  /// Get product candles
  ///
  /// Historic rates for a product. Rates are returned in grouped buckets.
  /// Candle schema is of the form \[timestamp, price_low, price_high,
  /// price_open, price_close\]
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getproductcandles
  ///
  Future<http.Response> getProductCandles({
    required String productId,
    GranularityEnum? granularity,
    DateTime? start,
    DateTime? end,
  }) async {
    Map<String, dynamic> queryParameters = {};
    if (granularity != null)
      queryParameters['granularity'] = granularity.seconds();
    if (start != null) queryParameters['start'] = start;
    if (end != null) queryParameters['end'] = end;

    return get(
      path: '/products/$productId/candles',
      queryParameters: queryParameters,
    );
  }

  /// Get product stats
  ///
  /// Gets 30day and 24hour stats for a product.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getproductstats
  ///
  Future<http.Response> getProductStats({
    required String productId,
  }) async =>
      get(path: '/products/$productId/stats');

  /// Get product ticker
  ///
  /// Gets snapshot information about the last trade (tick), best bid/ask and 24h volume.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getproductticker
  ///
  Future<http.Response> getProductTicker({
    required String productId,
  }) async =>
      get(path: '/products/$productId/ticker');

  /// Get product trades
  ///
  /// Gets a list the latest trades for a product.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getproducttrades
  ///
  Future<http.Response> getProductTrades({
    required String productId,
    int? limit,
    int? before,
    int? after,
  }) async {
    Map<String, dynamic> queryParameters = {};
    if (limit != null) queryParameters['limit'] = limit;
    if (before != null) queryParameters['before'] = before;
    if (after != null) queryParameters['after'] = after;

    return get(
      path: '/products/$productId/trades',
      queryParameters: queryParameters,
    );
  }
}
