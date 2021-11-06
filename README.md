# coinbase_exchange

An unofficial library for the coinbase cloud exchange.

![Gif](https://github.com/pcrady/coinbase_exchange/blob/main/example.gif "Real Time Price")

## Getting Started

This project is a Dart sdk the
[coinbase exchange api](https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getaccounts).
This sdk allows for the retrieval of real time pricing data using the coinbase websocket feed as well and information about
individual profiles on coinbase and coinbase pro. It also allows for the trading of
cryptocurrencies on the coinbase pro platform. This package uses api keys which must be generated
from [coinbase pro](https://pro.coinbase.com/) or the [coinbase pro sandbox](https://public.sandbox.pro.coinbase.com/).

To test to make sure you have generated your keys correctly, create a file test/secrets.dart with the contents:
```dart
class Secrets {
  static const String apiKey = '';
  static const String secretKey = '';
  static const String passphrase = '';
}
```
Put in your apiKey, secretKey and passphrase.
In the coinbase_exchange_test.dart file. Then run:
```console
pub run test --chain-stack-traces test/coinbase_exchange_test.dart
```
This will by default execute the tests in the coinbase pro sandbox so make sure you have used the appropriate keys. The tests are currently incomplete and only test Accounts, Coinbase Accounts, Conversions and Currencies.

## Websocket Feed

```dart
// Make sure to import the package as something so you dont polute your environment.
import 'package:coinbase_exchange/coinbase_exchange.dart' as cb;

cb.WebsocketClient wsClient = cb.WebsocketClient(sandbox: false);

var stream = wsClient.subscribe(
  productIds: ['ETH-USD'],
  channels: [
    cb.CoinbaseChannel.heartBeat,
  ],
);

// The first event is always a subscriptions event which tells you which channels you have subscribed to.
// After the first event it is up to you to manually sort events from the stream.
stream.listen((event) {
  print(event.toJson().toString());
  wsClient.close();
});
```

## API

```dart
// Make sure to import the package as something so you dont polute your environment.
import 'package:coinbase_exchange/coinbase_exchange.dart' as cb;

var accounts = await cb.accountsClient.listAccounts();

for (cb.Account account in accounts) {
  print(account.currency);
}
```
