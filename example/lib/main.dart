import 'dart:async';
import 'package:candlesticks/candlesticks.dart' as graph;
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:coinbase_exchange/coinbase_exchange.dart' as cb;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Coinbase Exchange Demo',
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _client = cb.WebsocketClient();
  final _streamController = StreamController.broadcast();
  final oCcy = NumberFormat("#,##0.00", "en_US");
  final _textStyle = const TextStyle(
    fontSize: 28.0,
    color: Colors.white70,
  );
  var btcPrice = '';
  var ethPrice = '';
  var ltePrice = '';
  final cb.ProductsClient productsClient = cb.ProductsClient(
    apiKey: '',
    secretKey: '',
    passphrase: '',
  );

  @override
  void initState() {
    _client.connect();
    _streamController.addStream(
      _client.subscribe(
        productIds: ['ETH-USD', 'BTC-USD', 'LTC-USD'],
        channels: [cb.ChannelEnum.ticker],
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    _client.close();
    _streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff113650),
        title: const Text(
          'Coinbase Exchange Demo',
          style: TextStyle(color: Colors.white70),
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            Color(0xff1d3f64),
            Color(0xff62467d),
          ],
        )),
        child: Center(
          child: Column(
            children: [
              FutureBuilder(
                future: productsClient.getProductCandles(
                  productId: 'BTC-USD',
                ),
                builder: (BuildContext context,
                    AsyncSnapshot<List<cb.Candle>> snapshot) {
                  if (snapshot.hasData) {
                    List<graph.Candle> candles = snapshot.data!
                        .map((e) => graph.Candle(
                              date: e.time!,
                              high: e.high!,
                              low: e.low!,
                              open: e.open!,
                              close: e.close!,
                              volume: e.volume!,
                            ))
                        .toList();
                    return AspectRatio(
                      aspectRatio: 1.2,
                      child: graph.Candlesticks(
                        candles: candles,
                        onIntervalChange: (_) async {},
                        interval: '1m',
                      ),
                    );
                  }
                  return Container();
                },
              ),
              const SizedBox(height: 28.0),
              StreamBuilder<dynamic>(
                stream: _streamController.stream,
                builder:
                    (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  if (snapshot.connectionState == ConnectionState.none) {
                    return const Text('None');
                  } else if (snapshot.connectionState ==
                      ConnectionState.waiting) {
                    return const Text('Waiting...');
                  } else if (snapshot.connectionState ==
                      ConnectionState.active) {
                    var data = snapshot.data;
                    if (data is cb.StreamTicker) {
                      if (data.productId == 'ETH-USD') {
                        ethPrice = '\$' + oCcy.format(data.price);
                      } else if (data.productId == 'LTC-USD') {
                        ltePrice = '\$' + oCcy.format(data.price);
                      } else {
                        btcPrice = '\$' + oCcy.format(data.price);
                      }

                      return Column(
                        children: [
                          Text(
                            'Bitcoin Price: $btcPrice',
                            style: _textStyle,
                          ),
                          const SizedBox(height: 18.0),
                          Text(
                            'Litecoin Price: $ltePrice',
                            style: _textStyle,
                          ),
                          const SizedBox(height: 18.0),
                          Text(
                            'Etherium Price $ethPrice',
                            style: _textStyle,
                          ),
                        ],
                      );
                    } else {
                      return const Text('Something Else');
                    }
                  } else if (snapshot.connectionState == ConnectionState.done) {
                    return const Text('Done');
                  }
                  return Container();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
