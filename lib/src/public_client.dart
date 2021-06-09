import 'dart:convert';
import 'package:coinbase_dart/src/coinbase_enums.dart';
import 'package:coinbase_dart/src/lib/candle.dart';
import 'package:coinbase_dart/src/lib/currency.dart';
import 'package:coinbase_dart/src/lib/order_book.dart';
import 'package:coinbase_dart/src/lib/product.dart';
import 'package:coinbase_dart/src/lib/stats.dart';
import 'package:coinbase_dart/src/lib/ticker.dart';
import 'package:coinbase_dart/src/lib/trade.dart';
import 'package:coinbase_dart/src/lib/tradeList.dart';
import 'package:http/http.dart' as http;
import 'package:logger/logger.dart';

class CoinbasePublicClient {
  String apiAuthority;
  String webSocketAuthority;
  static const String defaultProductId = 'BTC-USD';
  static const String defaultCurrencyId = 'BTC';
  Logger _logger = Logger();

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
    var response = await http.get(url, headers: _addHeaders(headers));

    if (response.statusCode == 429) {
      await Future.delayed(Duration(seconds: 1));
      return _get(path, headers: headers, queryParameters: queryParameters);
    }

    return response;
  }

  List<Map<String, dynamic>> _listDecode(String body) => List<Map<String, dynamic>>.from(json.decode(body));

  Map<String, dynamic> _mapDecode(String body) => Map<String, dynamic>.from(json.decode(body));

  Future<List<Product>> getProducts() async {
    var response = await _get('/products');
    return _listDecode(response.body).map((product) => Product.fromJson(product)).toList();
  }

  Future<Product> getSingleProduct({String productId = defaultProductId}) async {
    var response = await _get('/products/$productId');
    return Product.fromJson(_mapDecode(response.body));
  }

  Future<OrderBook> getProductOrderBook({
    String productId = defaultProductId,
    CoinbaseLevel? level,
  }) async {
    Map<String, dynamic> queryParameters = {};
    if (level != null) queryParameters['level'] = level.value().toString();

    var response = await _get(
      '/products/$productId/book',
      queryParameters: queryParameters,
    );
    return OrderBook.fromJson(_mapDecode(response.body));
  }

  Future<Ticker> getProductTicker({String productId = defaultProductId}) async {
    var response = await _get('/products/$productId/ticker');
    return Ticker.fromJson(_mapDecode(response.body));
  }

  Future<TradeList> getTrades({
    String productId = defaultProductId,
    int? before,
    int? after,
    int? limit,
  }) async {
    Map<String, dynamic> queryParameters = {};
    if (before != null) queryParameters['before'] = before.toString();
    if (after != null) queryParameters['after'] = after.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();

    var response = await _get(
      '/products/$productId/trades',
      queryParameters: queryParameters,
    );

    String? beforeString = response.headers['cb-before'];
    String? afterString = response.headers['cb-after'];
    int? beforeInt = beforeString == null ? null : int.parse(beforeString);
    int? afterInt = afterString == null ? null : int.parse(afterString);

    return TradeList(
      before: beforeInt,
      after: afterInt,
      trades: _listDecode(response.body).map((product) => Trade.fromJson(product)).toList(),
    );
  }

  Future<List<Candle>> getHistoricRates({
    String productId = defaultProductId,
    required DateTime start,
    required DateTime end,
    required CoinbaseGranularity granularity,
  }) async {
    var response = await _get(
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
    var response = await _get('/products/$productId/stats');
    return Stats.fromJson(_mapDecode(response.body));
  }

  Future<List<Currency>> getCurrencies() async {
    var response = await _get('/currencies');
    return _listDecode(response.body).map((currencies) => Currency.fromJson(currencies)).toList();
  }

  Future<Currency> getCurrency({String currencyId = defaultCurrencyId}) async {
    var response = await _get('/currencies/$currencyId');
    return Currency.fromJson(_mapDecode(response.body));
  }

  Future<DateTime?> getTime() async {
    var response = await _get('/time');
    return DateTime.parse(_mapDecode(response.body)['iso'] as String);
  }
}