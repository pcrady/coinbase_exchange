import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

abstract class CoinbaseRestClient {
  static const String defaultProductId = 'BTC-USD';
  static const String defaultCurrencyId = 'BTC';
  static const String apiAuthority = 'api.pro.coinbase.com';
  static const String sandboxApiAuthority = 'api-public.sandbox.pro.coinbase.com';
  final bool sandbox;
  String? apiKey;
  String? secretKey;
  String? passphrase;

  CoinbaseRestClient({
    this.sandbox = false,
    this.apiKey,
    this.secretKey,
    this.passphrase,
  });

  String get _authority => sandbox ? sandboxApiAuthority : apiAuthority;

  Map<String, dynamic> createPaginationQueryParameters({
    int? before,
    int? after,
    int? limit,
  }) {
    Map<String, dynamic> queryParameters = {};
    if (before != null) queryParameters['before'] = before.toString();
    if (after != null) queryParameters['after'] = after.toString();
    if (limit != null) queryParameters['limit'] = limit.toString();
    return queryParameters;
  }

  int? getBeforeHeader(http.Response response) {
    String? beforeString = response.headers['cb-before'] ;
    return beforeString == null ? null : int.parse(beforeString);
  }

  int? getAfterHeader(http.Response response) {
    String? afterString = response.headers['cb-after'];
    return afterString == null ? null : int.parse(afterString);
  }

  String _calculateSignature({
    required String method,
    required String requestPath,
    required String timestamp,
    Map<String, dynamic>? body,
 }) {
    method = method.toUpperCase();

    String preHashMessage = timestamp + method + requestPath;
    if (body != null) preHashMessage += jsonEncode(body);
    List<int> preHashMessageByes = utf8.encode(preHashMessage);

    List<int> hmacKey = base64.decode(secretKey ?? '');
    Hmac hmac =  Hmac(sha256, hmacKey);
    Digest digest = hmac.convert(preHashMessageByes);

    return base64.encode(digest.bytes);
  }

  Map<String, String> _addHeaders({
    String? method,
    String? requestPath,
    Map<String, dynamic>? body,
    Map<String, String>? additionalHeaders,
  }) {
    Map<String, String> headers = {
      'User-Agent': 'coinbase-pro-node-client',
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      ...?additionalHeaders,
    };

    if (apiKey == null
      || secretKey == null
      || passphrase == null
      || method == null
      || requestPath == null) return headers;

    String timestamp = (DateTime.now().millisecondsSinceEpoch * 0.001).toString();
    String signature = _calculateSignature(
      method: method,
      requestPath: requestPath,
      body: body,
      timestamp: timestamp,
    );

    headers = {
      ...headers,
      'CB-ACCESS-KEY': apiKey ?? '',
      'CB-ACCESS-PASSPHRASE': passphrase ?? '',
      'CB-ACCESS-TIMESTAMP': timestamp,
      'CB-ACCESS-SIGN': signature,
    };

    return headers;
  }

  Future<http.Response> get({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    Uri url = Uri.https(_authority, path, queryParameters);
    var response = await http.get(
      url,
      headers: _addHeaders(
        method: 'GET',
        requestPath: path,
        additionalHeaders: headers,
      ),
    );

    if (response.statusCode == 429) {
      await Future.delayed(Duration(seconds: 1));
      return get(path: path, headers: headers, queryParameters: queryParameters);
    }

    return response;
  }

  //Future<http.Response> _post(String path) async {
    //TODO
 // }

  List<Map<String, dynamic>> listDecode(String body) => List<Map<String, dynamic>>.from(json.decode(body));

  Map<String, dynamic> mapDecode(String body) => Map<String, dynamic>.from(json.decode(body));








  /*Future<List<Product>> getProducts() async {
    var response = await _get(path: '/products');
    return _listDecode(response.body).map((product) => Product.fromJson(product)).toList();
  }

  Future<Product> getSingleProduct({String productId = defaultProductId}) async {
    var response = await _get(path: '/products/$productId');
    return Product.fromJson(_mapDecode(response.body));
  }

  Future<OrderBook> getProductOrderBook({
    String productId = defaultProductId,
    CoinbaseLevel? level,
  }) async {
    Map<String, dynamic> queryParameters = {};
    if (level != null) queryParameters['level'] = level.value().toString();

    var response = await _get(
      path: '/products/$productId/book',
      queryParameters: queryParameters,
    );
    return OrderBook.fromJson(_mapDecode(response.body));
  }

  Future<Ticker> getProductTicker({String productId = defaultProductId}) async {
    var response = await _get(path: '/products/$productId/ticker');
    return Ticker.fromJson(_mapDecode(response.body));
  }

  Future<TradeList> getTrades({
    String productId = defaultProductId,
    int? before,
    int? after,
    int? limit,
  }) async {
    var response = await _get(
      path: '/products/$productId/trades',
      queryParameters: _createPaginationQueryParameters(
        before: before,
        after: after,
        limit: limit,
      ),
    );

    return TradeList(
      before: _getBeforeHeader(response),
      after: _getAfterHeader(response),
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
      path: '/products/$productId/candles',
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
    var response = await _get(path: '/products/$productId/stats');
    return Stats.fromJson(_mapDecode(response.body));
  }

  Future<List<Currency>> getCurrencies() async {
    var response = await _get(path: '/currencies');
    return _listDecode(response.body).map((currencies) => Currency.fromJson(currencies)).toList();
  }

  Future<Currency> getCurrency({String currencyId = defaultCurrencyId}) async {
    var response = await _get(path: '/currencies/$currencyId');
    return Currency.fromJson(_mapDecode(response.body));
  }

  Future<DateTime?> getTime() async {
    var response = await _get(path: '/time');
    return DateTime.parse(_mapDecode(response.body)['iso'] as String);
  }*/
}
