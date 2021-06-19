import 'dart:math';

import 'package:coinbase_dart/coinbase_dart.dart';
import 'package:coinbase_dart/src/models/channels.dart';
import 'package:coinbase_dart/src/models/heartbeat.dart';
import 'package:logger/logger.dart';
import 'package:test/test.dart';

// flutter pub run build_runner build
// flutter pub run test test/coinbase_dart_test.dart
// pub run test --chain-stack-traces test/coinbase_dart_test.dart
// dart --enable-asserts //to get Logger to work in terminal

// TODO actually learn how to test

void main() {
  Logger _logger = Logger();

  CoinbaseRestClient publicClient = CoinbaseRestClient(sandbox: true);
  CoinbaseWebsocketClient wsClient = CoinbaseWebsocketClient(sandbox: false);
  Stream<dynamic>? stream;

  group('Websocket Feed', () {
    test('Subscription Response', () async {
      wsClient.connect();
      stream = wsClient.subscribe(
        productIds: ['ETH-USD'],
        channels: [
          CoinbaseChannel.heartBeat,
        ],
      );

      stream?.listen((event) {
        expect(event is Subscriptions, true);
        wsClient.close();
      });
    });
  });

  group('Market Data', () {
    test('getProducts', () async {
      List<Product> products = await publicClient.getProducts();
      expect(products.every((product) => product.id != null), true);
    });

    test('getSingleProduct', () async {
      Product product = await publicClient.getSingleProduct();
      expect(product.id != null, true);
    });

    test('getOrderBook', () async {
      OrderBook orderBook = await publicClient.getProductOrderBook();
      expect(orderBook.sequence != null, true);
    });

    test('getOrderBook level 2', () async {
      OrderBook orderBook = await publicClient.getProductOrderBook(level: CoinbaseLevel.two);
      expect(orderBook.sequence != null, true);
    });

    test('getOrderBook level 3', () async {
      OrderBook orderBook = await publicClient.getProductOrderBook(level: CoinbaseLevel.three);
      expect(orderBook.sequence != null, true);
    });

    test('getProductTicker', () async {
      Ticker ticker = await publicClient.getProductTicker();
      expect(ticker.tradeId is int, true);
    });

    test('getTrades', () async {
      TradeList tradeList = await publicClient.getTrades();
      expect(tradeList.trades.length > 0, true);
    });

    test('test before getTrades pagination existence', () async {
      TradeList tradeList = await publicClient.getTrades();
      expect((tradeList.before ?? -1) >= 0, true);
    });

    test('test after getTrades pagination existence', () async {
      TradeList tradeList = await publicClient.getTrades();
      expect((tradeList.after ?? -1) >= 0, true);
    });

    test('test after getTrades limit', () async {
      TradeList tradeList = await publicClient.getTrades(limit: 50);
      expect(tradeList.trades.length, 50);
    });

    test('test after pagination', () async {
      TradeList tradeListOne = await publicClient.getTrades(limit: 100);
      TradeList tradeListTwo = await publicClient.getTrades(after: tradeListOne.after, limit: 100);
      expect((tradeListOne.after ?? 0) - (tradeListTwo.after ?? 0), 100);
    });

    test('getHistoricRates', () async {
      List<Candle> candles = await publicClient.getHistoricRates(
        start: DateTime.parse('2012-02-26 12:00:00'),
        end: DateTime.parse('2012-02-27 12:00:00'),
        granularity: CoinbaseGranularity.sixHours,
      );
      expect(candles.every((candle) => candle.time != null), true);
    });

    test('get24HourStats', () async {
      Stats stats = await publicClient.get24HourStats();
      expect(stats.low is double, true);
    });

    test('getCurrencies', () async {
      List<Currency> currencies = await publicClient.getCurrencies();
      expect(currencies.every((currency) => currency.id != null), true);
    });

    test('getCurrency', () async {
      Currency currency = await publicClient.getCurrency();
      expect(currency.id != null, true);
    });

    test('getTime', () async {
      DateTime? time = await publicClient.getTime();
      expect(time != null, true);
    });
  });
}
