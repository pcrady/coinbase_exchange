import 'package:coinbase_dart/src/lib/trade.dart';

class TradeList {
  int? before;
  int? after;
  List<Trade> trades;

  TradeList({
    required this.trades,
    this.before,
    this.after
  });
}