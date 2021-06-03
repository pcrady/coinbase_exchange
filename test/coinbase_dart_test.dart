import 'package:coinbase_dart/coinbase_dart.dart';
import 'package:coinbase_dart/src/lib/order_book.dart';
import 'package:test/test.dart';

// flutter pub run build_runner build
// flutter pub run test test/coinbase_dart_test.dart
// pub run test --chain-stack-traces test/coinbase_dart_test.dart

void main() {
  CoinbasePublicClient publicClient = CoinbasePublicClient(
    apiAuthority: 'api-public.sandbox.pro.coinbase.com',
  );

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

  test('getProductTicker', () async {
    Ticker ticker = await publicClient.getProductTicker();
    expect(ticker.tradeId is int, true);
  });

  //TODO test paginated trades
  test('getTrades', () async {
    List<Trade> trades = await publicClient.getTrades();
    expect(trades.every((trade) => trade.tradeId != null), true);
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
}
