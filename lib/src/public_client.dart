import 'dart:convert';
import 'package:coinbase_dart/src/coinbase_enums.dart';
import 'package:coinbase_dart/src/lib/candle.dart';
import 'package:coinbase_dart/src/lib/currency.dart';
import 'package:coinbase_dart/src/lib/product.dart';
import 'package:coinbase_dart/src/lib/stats.dart';
import 'package:coinbase_dart/src/lib/ticker.dart';
import 'package:coinbase_dart/src/lib/trade.dart';
import 'package:http/http.dart' as http;

const DEFAULT_TIMEOUT = 10 * 1000; // 10 sec

class PublicClient {
  String apiAuthority;
  String webSocketAuthority;
  String productID;
  int timeOut;
  int apiLimit = 100;

  PublicClient({
    this.apiAuthority = 'api.pro.coinbase.com',
    this.webSocketAuthority = 'wss://ws-feed.pro.coinbase.com',
    this.productID = 'BTC-USD',
    this.timeOut = DEFAULT_TIMEOUT,
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

  Future<Product> getSingleProduct(String productId) async {
    http.Response response = await _get('/products/$productId');
    Map<String, dynamic> body = Map<String, dynamic>.from(json.decode(response.body));
    return Product.fromJson(body);
  }

  //TODO look at streams for level 3
  getProductOrderBook(String productId, {Level? level}) async {
    http.Response response = await _get(
      '/products/$productId/book',
      queryParameters: {'level': level != null ? level.value().toString() : '1'},
    );
    Map<String, dynamic> body = Map<String, dynamic>.from(json.decode(response.body));
    return null;//Product.fromJson(body);
  }

  Future<Ticker> getProductTicker(String productId) async {
    http.Response response = await _get('/products/$productId/ticker');
    Map<String, dynamic> ticker = Map<String, dynamic>.from(json.decode(response.body));
    return Ticker.fromJson(ticker);
  }

  //TODO pagination from response headers
  Future<List<Trade>> getTrades(String productId) async {
    http.Response response = await _get('/products/$productId/trades');
    List<Map<String, dynamic>> body = List<Map<String, dynamic>>.from(json.decode(response.body));
    return body.map((product) => Trade.fromJson(product)).toList();
  }

  Future<List<Candle>> getHistoricRates(
    String productId,
    DateTime start,
    DateTime end,
    Granularity granularity,
  ) async {
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

  Future<Stats> get24HourStats(String productId) async {
    http.Response response = await _get('/products/$productId/stats');
    Map<String, dynamic> body = json.decode(response.body);
    return Stats.fromJson(body);
  }

  Future<List<Currency>> getCurrencies() async {
    http.Response response = await _get('/currencies');
    List<Map<String, dynamic>> body = List<Map<String, dynamic>>.from(json.decode(response.body));
    return body.map((currencies) => Currency.fromJson(currencies)).toList();
  }

  Future<Currency> getCurrency(String currencyId) async {
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