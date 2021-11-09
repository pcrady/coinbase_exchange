enum LevelEnum {
  one,
  two,
  three,
}

extension LevelExtension on LevelEnum {
  int value() {
    if (this == LevelEnum.one) return 1;
    if (this == LevelEnum.two)
      return 2;
    else
      return 3;
  }
}

enum GranularityEnum {
  oneMinute,
  fiveMinutes,
  fifteenMinutes,
  oneHour,
  sixHours,
  oneDay,
}

extension GranularityExtension on GranularityEnum {
  int seconds() {
    if (this == GranularityEnum.oneMinute) return 60;
    if (this == GranularityEnum.fiveMinutes) return 300;
    if (this == GranularityEnum.fifteenMinutes) return 900;
    if (this == GranularityEnum.oneHour) return 3600;
    if (this == GranularityEnum.sixHours)
      return 21600;
    else
      return 86400;
  }
}

enum SideEnum {
  buy,
  sell,
}

extension SideExtension on SideEnum {
  String side() {
    if (this == SideEnum.buy)
      return 'buy';
    else
      return 'sell';
  }
}

enum OrderEnum {
  limit,
  market,
  stop,
}

enum ActionEnum {
  subscribe,
  unsubscribe,
}

extension OrderExtension on OrderEnum {
  String orderType() {
    if (this == OrderEnum.limit) return 'limit';
    if (this == OrderEnum.market)
      return 'market';
    else
      return 'stop';
  }
}

enum ChannelEnum {
  heartBeat,
  status,
  ticker,
  level2,
  user,
  matches,
  full,
  auction,
}

extension ChannelExtension on ChannelEnum {
  String channel() {
    if (this == ChannelEnum.heartBeat) return 'heartbeat';
    if (this == ChannelEnum.status) return 'status';
    if (this == ChannelEnum.ticker) return 'ticker';
    if (this == ChannelEnum.level2) return 'level2';
    if (this == ChannelEnum.user) return 'user';
    if (this == ChannelEnum.matches) return 'matches';
    if (this == ChannelEnum.full)
      return 'full';
    else
      return 'auction';
  }
}

enum ReasonEnum {
  filled,
  canceled,
}

extension ReasonExtension on ReasonEnum {
  String reason() {
    return this == ReasonEnum.filled ? 'filled' : 'canceled';
  }
}

enum TransferEnum {
  withdrawal,
  deposit,
}

extension TransferExtension on TransferEnum {
  String transferType() {
    if (this == TransferEnum.withdrawal)
      return 'withdrawal';
    else
      return 'deposit';
  }
}
