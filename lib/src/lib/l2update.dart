
///
/// The changes property of l2updates is an array
/// with [side, price, size] tuples. The time property
/// of l2update is the time of the event as recorded
/// by our trading engine. Please note that size is
/// the updated size at that price level, not a delta.
/// A size of "0" indicates the price level can be removed.
///
class L2update {
  String? productId;
  List? changes;
  DateTime? time;

  L2update({
    this.productId,
    this.changes,
    this.time,
  });

  factory L2update.fromJson(Map<String, dynamic> json) {
    List _changes = [];
    for (var change in json['changes']) {
      List _change = [change[0], double.parse(change[1]), double.parse(change[2])];
      _changes.add(_change);
    }

    return L2update(
      productId: json['product_id'] as String?,
      time: json['time'] == null ? null : DateTime.parse(json['time'] as String),
      changes: _changes,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'changes': changes,
      'time': time?.toIso8601String(),
    };
  }
}