import 'package:coinbase_dart/coinbase_dart.dart';
import 'package:coinbase_dart/src/rest_clients/rest_client.dart';
import 'package:http/http.dart' as http;

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

  Future<http.Response> getAllTradingPairs() async =>
    get(path: '/products');

  Future<http.Response> getProduct({
    required String productId,
  }) async => get(path: '/products/$productId');

  Future<http.Response> getProductBook({
    required String productId,
    CoinbaseLevel? level,
  }) async {
    Map<String, dynamic> queryParameters = {};
    if (level != null) queryParameters['level'] = level.value();

    return get(
      path: '/products/$productId/book',
      queryParameters: queryParameters,
    );
  }

  Future<http.Response> getProductCandles({
    required String productId,
    CoinbaseGranularity? granularity,
    DateTime? start,
    DateTime? end,
  }) async {
    Map<String, dynamic> queryParameters = {};
    if (granularity != null) queryParameters['granularity'] = granularity.seconds();
    if (start != null) queryParameters['start'] = start;
    if (end != null) queryParameters['end'] = end;

    return get(
      path: '/products/$productId/candles',
      queryParameters: queryParameters,
    );
  }

  Future<http.Response> getProductStats({
    required String productId,
  }) async => get(path: '/products/$productId/stats');

  Future<http.Response> getProductTicker({
    required String productId,
  }) async => get(path: '/products/$productId/ticker');

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