import 'package:coinbase_dart/coinbase_dart.dart';
import 'package:test/test.dart';

// flutter pub run build_runner build
// flutter pub run test test/coinbase_dart_test.dart
// pub run test --chain-stack-traces test/coinbase_dart_test.dart

void main() {
  PublicClient publicClient = PublicClient(apiAuthority: 'api-public.sandbox.pro.coinbase.com');
  String defaultProductId = 'BTC-USD';
  String secondaryDefaultProductId = 'BTC';

  test('getProducts', () async {
    List<Product> products = await publicClient.getProducts();
    expect(products.every((product) => product.id != null), true);
  });

  test('getSingleProduct', () async {
    Product product = await publicClient.getSingleProduct(defaultProductId);
    expect(product.id != null, true);
  });

  // TODO
  test('getOrderBook', () async {
    expect(true, true);
  });

  test('getProductTicker', () async {
    Ticker ticker = await publicClient.getProductTicker(defaultProductId);
    expect(ticker.tradeId is int, true);
  });

  //TODO test paginated trades
  test('getTrades', () async {
    List<Trade> trades = await publicClient.getTrades(defaultProductId);
    expect(trades.every((trade) => trade.tradeId != null), true);
  });

  test('getHistoricRates', () async {
    List<Candle> candles = await publicClient.getHistoricRates(
      defaultProductId,
      DateTime.parse('2012-02-26 12:00:00'),
      DateTime.parse('2012-02-27 12:00:00'),
      Granularity.sixHours,
    );
    expect(candles.every((candle) => candle.time != null), true);
  });

  test('get24HourStats', () async {
    Stats stats = await publicClient.get24HourStats(defaultProductId);
    expect(stats.low is double, true);
  });

  test('getCurrencies', () async {
    List<Currency> currencies = await publicClient.getCurrencies();
    expect(currencies.every((currency) => currency.id != null), true);
  });

  test('getCurrency', () async {
    Currency currency = await publicClient.getCurrency(secondaryDefaultProductId);
    expect(currency.id != null, true);
  });

  test('getTime', () async {
    DateTime? time = await publicClient.getTime();
    expect(time != null, true);
  });
}
