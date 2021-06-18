
//TODO actually make this explicit instead of shitty touple things

class Snapshot {
  final String? productId;
  final List<List<double>>? bids;
  final List<List<double>>? asks;

  Snapshot({
    this.productId,
    this.bids,
    this.asks,
  });

  factory Snapshot.fromJson(Map<String, dynamic> json) {
    List<List<double>> bidsDouble = [];
    for (List bid in json['bids']) {
      List<double> bidDouble = [];
      for (String numStr in bid) {
        double numDub = double.parse(numStr);
        bidDouble.add(numDub);
      }
      bidsDouble.add(bidDouble);
    }


    List<List<double>> asksDouble = [];
    for (List ask in json['asks']) {
      List<double> askDouble = [];
      for (String numStr in ask) {
        double numDub = double.parse(numStr);
        askDouble.add(numDub);
      }
      asksDouble.add(askDouble);
    }

    return Snapshot(
      productId: json['product_id'] as String?,
      bids: bidsDouble,
      asks: asksDouble,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'product_id': productId,
      'bids': bids,
      'asks': asks,
    };
  }
}