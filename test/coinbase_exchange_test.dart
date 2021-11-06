import 'package:coinbase_exchange/coinbase_exchange.dart';
import 'package:logger/logger.dart';
import 'package:test/test.dart';
import 'package:http/http.dart' as http;
import 'secrets.dart';

/// flutter pub run build_runner build
/// flutter pub run test test/coinbase_exchange_test.dart
/// pub run test --chain-stack-traces test/coinbase_exchange_test.dart
/// dart --enable-asserts //to get Logger to work in terminal

void main() {
  Logger _logger = Logger();
  Stream<dynamic>? stream;
  final bool sandbox = true;

  WebsocketClient wsClient = WebsocketClient(sandbox: false);

  AccountsClient accountsClient = AccountsClient(
    sandbox: sandbox,
    secretKey: Secrets.secretKey,
    passphrase: Secrets.passphrase,
    apiKey: Secrets.apiKey,
  );

  CoinbaseAccountsClient coinbaseAccountsClient = CoinbaseAccountsClient(
    sandbox: sandbox,
    secretKey: Secrets.secretKey,
    passphrase: Secrets.passphrase,
    apiKey: Secrets.apiKey,
  );

  ConversionsClient conversionsClient = ConversionsClient(
    sandbox: sandbox,
    secretKey: Secrets.secretKey,
    passphrase: Secrets.passphrase,
    apiKey: Secrets.apiKey,
  );

  CurrenciesClient currenciesClient = CurrenciesClient(
    sandbox: sandbox,
    secretKey: Secrets.secretKey,
    passphrase: Secrets.passphrase,
    apiKey: Secrets.apiKey,
  );

  OrdersClient ordersClient = OrdersClient(
    sandbox: sandbox,
    apiKey: Secrets.apiKey,
    secretKey: Secrets.secretKey,
    passphrase: Secrets.passphrase,
  );

  void logResponse(http.Response response) =>
      _logger.e('${response.statusCode}\n${response.body}');

  // a better test would be to subscribe to everything and verify that you eventually
  // recieve at least one of each response.
  group('Websocket Feed', () {
    test('Subscription Response', () async {
      wsClient.connect();
      stream = wsClient.subscribe(
        productIds: ['BTC-USD'],
        channels: [
          CoinbaseChannel.heartBeat,
        ],
      );

      stream?.listen((event) {
        // The first event is always a subscriptions event which tells you which channels you have subscribed to.
        // After the first event it is up to you to manually sort events from the stream.
        expect(event is Subscriptions, true);
        wsClient.close();
      });
    });
  });

  group('Accounts tests', () {
    late String accountId;

    test('listAccounts', () async {
      List<Account>? accounts;
      try {
        accounts = await accountsClient.listAccounts();
        for (Account account in accounts) {
          if (account.currency == 'BTC') {
            accountId = account.id!;
          }
        }
      } on http.Response catch (e) {
        logResponse(e);
      } finally {
        expect(accounts!.length != 0, true);
      }
    });

    test('getAccount', () async {
      Account? account;
      try {
        account = await accountsClient.getAccount(accountId: accountId);
      } on http.Response catch (e) {
        logResponse(e);
      } finally {
        expect(account!.balance! > 0, true);
      }
    });

    test('getHolds', () async {
      Paginator<Hold, DateTime>? holds;
      try {
        holds = await accountsClient.getHolds(accountId: accountId);
      } on http.Response catch (e) {
        logResponse(e);
      } finally {
        expect(holds?.elements != null, true);
      }
    });

    test('getAccountLedger', () async {
      Paginator<LedgerEntry, DateTime>? ledger;
      try {
        ledger = await accountsClient.getAccountLedger(accountId: accountId);
      } on http.Response catch (e) {
        logResponse(e);
      } finally {
        expect(ledger?.elements != null, true);
      }
    });

    test('getAccountTransfers', () async {
      Paginator<Transfer, DateTime>? transfers;
      try {
        transfers =
            await accountsClient.getAccountTransfers(accountId: accountId);
      } on http.Response catch (e) {
        logResponse(e);
      } finally {
        expect(transfers?.elements != null, true);
      }
    });
  });

  group('Coinbase Accounts', () {
    late String accountId;

    test('getCoinbaseWallets', () async {
      List<Wallet>? wallets;
      try {
        wallets = await coinbaseAccountsClient.getCoinbaseWallets();
        wallets.forEach((wallet) {
          if (wallet.name == 'BTC Wallet') {
            accountId = wallet.id!;
          }
        });
      } on http.Response catch (e) {
        logResponse(e);
      } finally {
        expect(wallets!.first.currency != null, true);
      }
    });

    test('generateCryptoAddress', () async {
      CryptoAddress? cryptoAddress;
      try {
        cryptoAddress = await coinbaseAccountsClient.generateCryptoAddress(
            accountId: accountId);
      } on http.Response catch (e) {
        logResponse(e);
      } finally {
        expect(cryptoAddress?.address != null, true);
      }
    });
  });

  group('Conversions', () {
    late String conversionId;

    test('convertCurrency', () async {
      double amount = 40.0;
      Conversion? conversion;
      try {
        conversion = await conversionsClient.convertCurrency(
          from: 'USD',
          to: 'USDC',
          amount: amount,
        );
      } on http.Response catch (e) {
        logResponse(e);
      } finally {
        conversionId = conversion!.id!;
        expect(conversion.amount == amount, true);
      }
    });

    test('getConversion', () async {
      Conversion? conversion;
      try {
        conversion =
            await conversionsClient.getConversion(conversionId: conversionId);
      } on http.Response catch (e) {
        logResponse(e);
      } finally {
        expect(conversion?.id == conversionId, true);
      }
    });
  });

  group('Currencies', () {
    test('getAllCurrencies', () async {
      List<Currency>? currencies;
      Currency? usdCurrency;
      try {
        currencies = await currenciesClient.getAllCurrencies();
        for (var currency in currencies) {
          if (currency.id == 'USD') {
            usdCurrency = currency;
          }
        }
      } on http.Response catch (e) {
        logResponse(e);
      } finally {
        expect(usdCurrency?.name == 'United States Dollar', true);
      }
    });

    test('getCurrency', () async {
      Currency? currency;
      try {
        currency = await currenciesClient.getCurrency(currencyId: 'USD');
      } on http.Response catch (e) {
        logResponse(e);
      } finally {
        expect(currency?.name == 'United States Dollar', true);
      }
    });
  });

  group('Transfers', () {});

  group('Orders', () {
    test('getAllFills', () async {
      List<Fill>? fills;
      try {
        fills = await ordersClient.getAllFills(productId: 'BTC-USD');
      } on http.Response catch (e) {
        logResponse(e);
      } finally {
        expect(fills?.isNotEmpty, true);
      }
    });
  });

  group('Products', () {});
  group('Profiles', () {});
  group('Reports', () {});
  group('Users', () {});
}
