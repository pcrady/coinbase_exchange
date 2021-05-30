import 'dart:convert';

import 'package:coinbase_dart/src/coinbase_enums.dart';
import 'package:coinbase_dart/src/lib/candle.dart';
import 'package:coinbase_dart/src/lib/product.dart';
import 'package:coinbase_dart/src/lib/stats.dart';
import 'package:coinbase_dart/src/lib/ticker.dart';
import 'package:coinbase_dart/src/lib/trade.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

const DEFAULT_TIMEOUT = 10 * 1000; // 10 sec

class PublicClient {
  String apiURI;
  String productID;
  int timeOut;
  int apiLimit = 100;

  PublicClient({
    this.apiURI = 'https://api.pro.coinbase.com',
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
    Uri url = Uri.https(apiURI, path, queryParameters);
    return http.get(url, headers: _addHeaders(headers));
  }

  /*_put(path) {
    return request('put', ...args);
  }

  _post(path) {
    return request('post', ...args);
  }

  _delete(path) {
    return request('delete', ...args);
  }*/

  Future<List<Product>> getProducts() async {
    http.Response response = await _get('/products');
    List<Map<String, dynamic>> body = json.decode(response.body);
    return body.map((product) => Product.fromJson(product)).toList();
  }

  Future<Product> getSingleProduct() async {
    http.Response response = await _get('/products');
    Map<String, dynamic> body = json.decode(response.body);
    return Product.fromJson(body);
  }

  //TODO look at streams for level 3
  getProductOrderBook(String productId, {Level? level}) async {

  }

  Future<List<Ticker>> getProductTicker(String productId) async {
    http.Response response = await _get('/products/$productId/ticker');
    List<Map<String, dynamic>> body = json.decode(response.body);
    return body.map((product) => Ticker.fromJson(product)).toList();
  }

  //TODO pagination from response headers
  Future<List<Trade>> getTrades(String productId) async {
    http.Response response = await _get('/products/$productId/trades');
    List<Map<String, dynamic>> body = json.decode(response.body);
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
        'granularity': granularity.seconds(),
      },
    );
    List body = json.decode(response.body);
    return body.map((candle) => Candle.fromList(candle)).toList();
  }

  Future<Stats> get24HourStats(String productId) async {
    http.Response response = await _get('/products/$productId/stats');
    Map<String, dynamic> body = json.decode(response.body);
    return Stats.fromJson(body);
  }
}