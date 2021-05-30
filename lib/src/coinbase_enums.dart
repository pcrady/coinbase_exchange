enum Level {
  one,
  two,
  three,
}

extension Value on Level {
  int value() {
    if (this == Level.one) return 1;
    if (this == Level.two) return 2;
    else return 3;
  }
}

enum Granularity {
  oneMinute,
  fiveMinutes,
  fifteenMinutes,
  oneHour,
  sixHours,
  oneDay,
}

extension Seconds on Granularity {
  int seconds() {
    if (this == Granularity.oneMinute) return 60;
    if (this == Granularity.fiveMinutes) return 300;
    if (this == Granularity.fifteenMinutes) return 900;
    if (this == Granularity.oneHour) return 3600;
    if (this == Granularity.sixHours) return 21600;
    else return 86400;
  }
}

enum Side {
  buy,
  sell,
}