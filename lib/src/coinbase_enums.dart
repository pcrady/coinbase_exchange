enum CoinbaseLevel {
  one,
  two,
  three,
}

extension Value on CoinbaseLevel {
  int value() {
    if (this == CoinbaseLevel.one) return 1;
    if (this == CoinbaseLevel.two) return 2;
    else return 3;
  }
}

enum CoinbaseGranularity {
  oneMinute,
  fiveMinutes,
  fifteenMinutes,
  oneHour,
  sixHours,
  oneDay,
}

extension Seconds on CoinbaseGranularity {
  int seconds() {
    if (this == CoinbaseGranularity.oneMinute) return 60;
    if (this == CoinbaseGranularity.fiveMinutes) return 300;
    if (this == CoinbaseGranularity.fifteenMinutes) return 900;
    if (this == CoinbaseGranularity.oneHour) return 3600;
    if (this == CoinbaseGranularity.sixHours) return 21600;
    else return 86400;
  }
}

enum CoinbaseSide {
  buy,
  sell,
}

enum CoinbaseChannel {
  heartBeat,
  status,
  ticker,
  level2,
  user,
  matches,
  full,
}

extension Channel on CoinbaseChannel {
  String channel() {
    if (this == CoinbaseChannel.heartBeat) return 'heartbeat';
    if (this == CoinbaseChannel.status) return 'status';
    if (this == CoinbaseChannel.ticker) return 'ticker';
    if (this == CoinbaseChannel.level2) return 'level2';
    if (this == CoinbaseChannel.user) return 'user';
    if (this == CoinbaseChannel.matches) return 'matches';
    else return 'full';
  }
}