import 'dart:async';

import 'package:flutter/material.dart';
import 'package:coinbase_exchange/coinbase_exchange.dart' as cb;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coinbase Exchange Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
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
  var btcPrice = '';
  var ethPrice = '';

  @override
  void initState() {
    _client.connect();
    _streamController.addStream(
      _client.subscribe(
        productIds: ['ETH-USD', 'BTC-USD'],
        channels: [cb.CoinbaseChannel.ticker],
      )!,
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
        title: const Text('Coinbase Exchange Demo'),
      ),
      body: Center(
        child: StreamBuilder<dynamic>(
            stream: _streamController.stream,
            builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
              if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }

              if (snapshot.connectionState == ConnectionState.none) {
                return const Text('None');
              } else if (snapshot.connectionState == ConnectionState.waiting) {
                return const Text('Waiting...');
              } else if (snapshot.connectionState == ConnectionState.active) {
                var data = snapshot.data;
                if (data is cb.StreamTicker) {
                  if (data.productId == 'ETH-USD') {
                    ethPrice = data.price.toString();
                  } else {
                    btcPrice = data.price.toString();
                  }

                  return Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Bitcoin price: $btcPrice'),
                      const SizedBox(height: 12.0),
                      Text('Etherium Price $ethPrice'),
                    ],
                  );
                } else {
                  return const Text('Something else');
                }
              } else if (snapshot.connectionState == ConnectionState.done) {
                return const Text('Done');
              }
              return Container();
            }),
      ),
    );
  }
}
