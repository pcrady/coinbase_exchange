import '../../coinbase_exchange.dart';

class ProductStats {
  final String? tradingPair;
  final Stats? stats30Day;
  final Stats? stats24Hour;

  ProductStats({
    this.tradingPair,
    this.stats30Day,
    this.stats24Hour,
  });
}
