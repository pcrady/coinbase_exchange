import '../models/trade.dart';

/// An object which manages a list of trades in
/// an interval for a given product.
class TradeList {
  final int? before;
  final int? after;
  final List<Trade> trades;

  TradeList({required this.trades, this.before, this.after});

  Map<String, dynamic> toJson() {
    return {
      'trades': trades.map((e) => e.toJson()),
      'before': before,
      'after': after,
    };
  }
}
