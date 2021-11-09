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

enum ReportTypeEnum {
  fills,
  account,
  otc_fills,
  type_1099k_transaction_history,
  tax_invoice,
}

extension ReportTypeExtension on ReportTypeEnum {
  String reportType() {
    if (this == ReportTypeEnum.fills) return 'fills';
    if (this == ReportTypeEnum.account) return 'account';
    if (this == ReportTypeEnum.otc_fills) return 'otc-fills';
    if (this == ReportTypeEnum.type_1099k_transaction_history) return '1099-transaction-history';
    else return 'tax-invoice';
  }
}

enum ReportFormatEnum {
  pdf,
  csv,
}

extension ReportFormatExtension on ReportFormatEnum {
  String reportFormat() {
    if (this == ReportFormatEnum.pdf) return 'pdf';
    else return 'csv';
  }
}

enum SortedByEnum {
  created_at,
  price,
  size,
  order_id,
  side,
  type,
}

extension SortedByExtension on SortedByEnum {
  String sortType() {
    if (this == SortedByEnum.created_at) return 'created-at';
    if (this == SortedByEnum.price) return 'price';
    if (this == SortedByEnum.size) return 'size';
    if (this == SortedByEnum.order_id) return 'order-id';
    if (this == SortedByEnum.side) return 'side';
    else return 'type';
  }
}

enum SortingEnum {
  asc,
  desc,
}

extension SortingExtension on SortingEnum {
  String sorting() {
    if (this == SortingEnum.asc) return 'asc';
    else return 'desc';
  }
}

enum StatusEnum {
  open,
  pending,
  rejected,
  done,
  active,
  received,
  all,
}

extension StatusExtension on StatusEnum {
  String status() {
    if (this == StatusEnum.open) return 'open';
    if (this == StatusEnum.pending) return 'pending';
    if (this == StatusEnum.rejected) return 'rejected';
    if (this == StatusEnum.done) return 'done';
    if (this == StatusEnum.active) return 'active';
    if (this == StatusEnum.received) return 'received';
    else return 'all';
  }
}

enum StpEnum {
  dc,
  co,
  cn,
  cb,
}

extension StpExtension on StpEnum {
  String stp() {
    if (this == StpEnum.dc) return 'dc';
    if (this == StpEnum.co) return 'co';
    if (this == StpEnum.cn) return 'cn';
    else return 'cb';
  }
}

enum StopEnum {
  loss,
  entry,
}

extension StopExtension on StopEnum {
  String stop() {
    if (this == StopEnum.loss) return 'loss';
    else return 'entry';
  }
}

enum TimeInForceEnum {
  GTC,
  GTT,
  IOC,
  FOK,
}

extension TimeInForceExtension on TimeInForceEnum {
  String timeInForce() {
    if (this == TimeInForceEnum.GTC) return 'GTC';
    if (this == TimeInForceEnum.GTT) return 'GTT';
    if (this == TimeInForceEnum.IOC) return 'IOC';
    else return 'FOK';
  }
}

enum CancelAfterEnum {
  min,
  hour,
  day,
}

extension CancelAfterExtension on CancelAfterEnum {
  String cancelAfter() {
    if (this == CancelAfterEnum.min) return 'min';
    if (this == CancelAfterEnum.hour) return 'hour';
    else return 'day';
  }
}