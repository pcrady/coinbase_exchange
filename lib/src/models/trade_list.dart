import 'package:coinbase_exchange/src/models/trade.dart';

class TradeList {
  final int? before;
  final int? after;
  final List<Trade> trades;

  TradeList({
    required this.trades,
    this.before,
    this.after
  });

  Map<String, dynamic> toJson() {
    return {
      'trades': trades.map((e) => e.toJson()),
      'before': before,
      'after': after,
    };
  }
}