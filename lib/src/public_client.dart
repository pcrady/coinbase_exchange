import 'dart:convert';
import 'package:coinbase_dart/src/coinbase_enums.dart';
import 'package:coinbase_dart/src/lib/candle.dart';
import 'package:coinbase_dart/src/lib/currency.dart';
import 'package:coinbase_dart/src/lib/order_book.dart';
import 'package:coinbase_dart/src/lib/product.dart';
import 'package:coinbase_dart/src/lib/stats.dart';
import 'package:coinbase_dart/src/lib/ticker.dart';
import 'package:coinbase_dart/src/lib/trade.dart';
import 'package:http/http.dart' as http;

const DEFAULT_TIMEOUT = 10 * 1000; // 10 sec

class CoinbasePublicClient {
  String apiAuthority;
  String webSocketAuthority;
  static const String defaultProductId = 'BTC-USD';
  static const String defaultCurrencyId = 'BTC';
  int apiLimit = 100;

  CoinbasePublicClient({
    this.apiAuthority = 'api.pro.coinbase.com',
    this.webSocketAuthority = 'wss://ws-feed.pro.coinbase.com',
  });

  Map<String, String> _addHeaders(Map<String, String>? additionalHeaders) {
    Map<String, String> headers = {
      'User-Agent': 'coinbase-pro-node-client',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
    };
    return additionalHeaders == null ? headers : {...headers, ...additionalHeaders};
  }

  Future<http.Response> _get(
    String path, {
      Map<String, String>? headers,
      Map<String, dynamic>? queryParameters,
    }) async {
    Uri url = Uri.https(apiAuthority, path, queryParameters);
    return http.get(url, headers: _addHeaders(headers));
  }

  Future<List<Product>> getProducts() async {
    http.Response response = await _get('/products');
    List<Map<String, dynamic>> body = List<Map<String, dynamic>>.from(json.decode(response.body));
    return body.map((product) => Product.fromJson(product)).toList();
  }

  Future<Product> getSingleProduct({String productId = defaultProductId}) async {
    http.Response response = await _get('/products/$productId');
    Map<String, dynamic> body = Map<String, dynamic>.from(json.decode(response.body));
    return Product.fromJson(body);
  }

  Future<OrderBook> getProductOrderBook({
    String productId = defaultProductId,
    CoinbaseLevel? level,
  }) async {
    http.Response response = await _get(
      '/products/$productId/book',
      queryParameters: {'level': level != null ? level.value().toString() : '1'},
    );
    Map<String, dynamic> body = Map<String, dynamic>.from(json.decode(response.body));
    return OrderBook.fromJson(body);
  }

  Future<Ticker> getProductTicker({String productId = defaultProductId}) async {
    http.Response response = await _get('/products/$productId/ticker');
    Map<String, dynamic> ticker = Map<String, dynamic>.from(json.decode(response.body));
    return Ticker.fromJson(ticker);
  }

  //TODO pagination from response headers
  Future<List<Trade>> getTrades({String productId = defaultProductId}) async {
    http.Response response = await _get('/products/$productId/trades');
    List<Map<String, dynamic>> body = List<Map<String, dynamic>>.from(json.decode(response.body));
    return body.map((product) => Trade.fromJson(product)).toList();
  }

  Future<List<Candle>> getHistoricRates({
    String productId = defaultProductId,
    required DateTime start,
    required DateTime end,
    required CoinbaseGranularity granularity,
  }) async {
    http.Response response = await _get(
      '/products/$productId/candles',
      queryParameters: {
        'start': start.toIso8601String(),
        'end': end.toIso8601String(),
        'granularity': granularity.seconds().toString(),
      },
    );
    List<List> body = List<List>.from(json.decode(response.body));
    return body.map((candle) => Candle.fromList(candle)).toList();
  }

  Future<Stats> get24HourStats({String productId = defaultProductId}) async {
    http.Response response = await _get('/products/$productId/stats');
    Map<String, dynamic> body = json.decode(response.body);
    return Stats.fromJson(body);
  }

  Future<List<Currency>> getCurrencies() async {
    http.Response response = await _get('/currencies');
    List<Map<String, dynamic>> body = List<Map<String, dynamic>>.from(json.decode(response.body));
    return body.map((currencies) => Currency.fromJson(currencies)).toList();
  }

  Future<Currency> getCurrency({String currencyId = defaultCurrencyId}) async {
    http.Response response = await _get('/currencies/$currencyId');
    Map<String, dynamic> body = json.decode(response.body);
    return Currency.fromJson(body);
  }

  Future<DateTime?> getTime() async {
    http.Response response = await _get('/time');
    Map<String, dynamic> body = json.decode(response.body);
    return DateTime.parse(body['iso'] as String);
  }
}