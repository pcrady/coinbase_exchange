class Candle {
  final DateTime? time;
  final double? low;
  final double? high;
  final double? open;
  final double? close;
  final double? volume;

  Candle({
    this.time,
    this.low,
    this.high,
    this.open,
    this.close,
    this.volume,
  });

  factory Candle.fromList(List bucket) {
    assert(bucket.length == 6);
    return  Candle(
      time: DateTime.fromMillisecondsSinceEpoch(bucket[0] as int),
      low: (bucket[1] as num).toDouble(),
      high: (bucket[2] as num).toDouble(),
      open: (bucket[3] as num).toDouble(),
      close: (bucket[4] as num).toDouble(),
      volume: (bucket[5] as num).toDouble(),
    );
  }
}