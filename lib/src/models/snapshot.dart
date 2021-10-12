import 'package:coinbase_exchange/src/lib/websocket_response.dart';
import '../lib/websocket_response.dart';
import 'package:tuple/tuple.dart';

class Snapshot extends WebsocketResponse {
  final String? type;
  final String? productId;
  final List<Tuple2<double, double>>? bids;
  final List<Tuple2<double, double>>? asks;

  Snapshot({
    this.type,
    this.productId,
    this.bids,
    this.asks,
  });

  factory Snapshot.fromJson(Map<String, dynamic> json) {
    List<Tuple2<double, double>> bidsDouble = [];
    for (List bid in json['bids']) {
      Tuple2<double, double> bidDouble =
          Tuple2(double.parse(bid[0]), double.parse(bid[1]));
      bidsDouble.add(bidDouble);
    }

    List<Tuple2<double, double>> asksDouble = [];
    for (List ask in json['asks']) {
      Tuple2<double, double> askDouble =
          Tuple2(double.parse(ask[0]), double.parse(ask[1]));
      asksDouble.add(askDouble);
    }

    return Snapshot(
      type: json['type'] as String?,
      productId: json['product_id'] as String?,
      bids: bidsDouble,
      asks: asksDouble,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'type': type,
      'product_id': productId,
      'bids': bids?.map((tuple) => tuple.toList()).toList(),
      'asks': asks?.map((tuple) => tuple.toList()).toList(),
    };
  }
}
