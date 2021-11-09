import 'dart:convert';
import 'package:crypto/crypto.dart';
import 'package:http/http.dart' as http;

/// An abstract class for clients which return http.Response objects
abstract class RestClient {
  static const String defaultProductId = 'BTC-USD';
  static const String defaultCurrencyId = 'BTC';
  static const String apiAuthority = 'api.exchange.coinbase.com';
  static const String sandboxApiAuthority =
      'api-public.sandbox.exchange.coinbase.com';
  final bool sandbox;
  String? apiKey;
  String? secretKey;
  String? passphrase;

  RestClient({
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
    String? beforeString = response.headers['cb-before'];
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
    Hmac hmac = Hmac(sha256, hmacKey);
    Digest digest = hmac.convert(preHashMessageByes);

    return base64.encode(digest.bytes);
  }

  // Note request path includes query parameters
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

    if (apiKey == null ||
        secretKey == null ||
        passphrase == null ||
        method == null ||
        requestPath == null) return headers;

    String timestamp =
        (DateTime.now().millisecondsSinceEpoch * 0.001).toString();
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

  Map<String, dynamic> _convertQueryParametersTypes(
    Map<String, dynamic> queryParameters,
  ) {
    return queryParameters.map((key, value) {
      if (value is! String || value is! Iterable<String>) {
        if (value is! Iterable) {
          return MapEntry(
            key,
            value is DateTime ? value.toIso8601String() : value.toString(),
          );
        } else {
          return MapEntry(
            key,
            value.map((element) => element is DateTime
                ? element.toIso8601String()
                : element.toString()),
          );
        }
      }
      return MapEntry(key, value);
    });
  }

  Future<http.Response> get({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (queryParameters != null) {
      queryParameters = _convertQueryParametersTypes(queryParameters);
    }

    Uri url = Uri.https(_authority, path, queryParameters);
    var response = await http.get(
      url,
      headers: _addHeaders(
        method: 'GET',
        requestPath:
            queryParameters != null ? '${url.path}?${url.query}' : url.path,
        additionalHeaders: headers,
      ),
    );

    if (response.statusCode == 429) {
      await Future.delayed(Duration(seconds: 1));
      return get(
        path: path,
        headers: headers,
        queryParameters: queryParameters,
      );
    }

    return response;
  }

  Future<http.Response> post({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    Uri url = Uri.https(_authority, path);
    var response = await http.post(
      url,
      body: body != null ? jsonEncode(body) : null,
      headers: _addHeaders(
        method: 'POST',
        requestPath: url.path,
        additionalHeaders: headers,
        body: body,
      ),
    );

    if (response.statusCode == 429) {
      await Future.delayed(Duration(seconds: 1));
      return post(
        path: path,
        headers: headers,
        body: body,
      );
    }

    return response;
  }

  Future<http.Response> put({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? body,
  }) async {
    Uri url = Uri.https(_authority, path);
    var response = await http.put(
      url,
      body: body != null ? jsonEncode(body) : null,
      headers: _addHeaders(
        method: 'PUT',
        requestPath: url.path,
        additionalHeaders: headers,
        body: body,
      ),
    );

    if (response.statusCode == 429) {
      await Future.delayed(Duration(seconds: 1));
      return put(
        path: path,
        headers: headers,
        body: body,
      );
    }

    return response;
  }

  Future<http.Response> delete({
    required String path,
    Map<String, String>? headers,
    Map<String, dynamic>? queryParameters,
  }) async {
    if (queryParameters != null) {
      queryParameters = _convertQueryParametersTypes(queryParameters);
    }

    Uri url = Uri.https(_authority, path, queryParameters);
    var response = await http.delete(
      url,
      headers: _addHeaders(
        method: 'DELETE',
        requestPath:
            queryParameters != null ? '${url.path}?${url.query}' : url.path,
        additionalHeaders: headers,
      ),
    );

    if (response.statusCode == 429) {
      await Future.delayed(Duration(seconds: 1));
      return delete(
        path: path,
        headers: headers,
        queryParameters: queryParameters,
      );
    }

    return response;
  }
}
