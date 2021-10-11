import 'package:coinbase_dart/coinbase_exchange.dart';
import 'package:tuple/tuple.dart';

///
/// The changes property of l2updates is an array
/// with [side, price, size] tuples. The time property
/// of l2update is the time of the event as recorded
/// by our trading engine. Please note that size is
/// the updated size at that price level, not a delta.
/// A size of "0" indicates the price level can be removed.
///
class L2update {
  final String? type;
  final String? productId;
  final List<Tuple3<CoinbaseSide, double, double>>? changes;
  final DateTime? time;

  L2update({
    this.type,
    this.productId,
    this.changes,
    this.time,
  });

  factory L2update.fromJson(Map<String, dynamic> json) {
    List<Tuple3<CoinbaseSide, double, double>> _changes = [];
    for (var change in json['changes']) {
      var _change = Tuple3(
        change[0] == 'buy' ? CoinbaseSide.buy : CoinbaseSide.sell,
        double.parse(change[1]),
        double.parse(change[2]),
      );
      _changes.add(_change);
    }

    return L2update(
      type: json['type'] as String?,
      productId: json['product_id'] as String?,
      time: json['time'] == null ? null : DateTime.parse(json['time'] as String),
      changes: _changes,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'product_id': productId,
      'changes': changes?.map((tuple) {
        var list = tuple.toList();
        CoinbaseSide side = list[0];
        list[0] = side.side();
        return list;
      }).toList(),
      'time': time?.toIso8601String(),
    };
  }
}