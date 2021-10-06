import 'package:coinbase_dart/coinbase_dart.dart';
import 'package:coinbase_dart/secrets.dart';
import 'package:coinbase_dart/src/clients/accounts_client.dart';
import 'package:coinbase_dart/src/clients/coinbase_accounts_client.dart';
import 'package:coinbase_dart/src/models/account.dart';
import 'package:coinbase_dart/src/models/channels.dart';
import 'package:coinbase_dart/src/models/wallet.dart';
import 'package:logger/logger.dart';
import 'package:test/test.dart';

// flutter pub run build_runner build
// flutter pub run test test/coinbase_dart_test.dart
// pub run test --chain-stack-traces test/coinbase_dart_test.dart
// dart --enable-asserts //to get Logger to work in terminal

// TODO actually learn how to test

void main() {
  Logger _logger = Logger();
  Stream<dynamic>? stream;

  CoinbaseWebsocketClient wsClient = CoinbaseWebsocketClient(sandbox: false);

  AccountsClient accountsClient = AccountsClient(
    sandbox: true,
    secretKey: Secrets.secretKey,
    passphrase: Secrets.passphrase,
    apiKey: Secrets.apiKey,
  );

  CoinbaseAccountsClient coinbaseAccountsClient = CoinbaseAccountsClient(
    sandbox: true,
    secretKey: Secrets.secretKey,
    passphrase: Secrets.passphrase,
    apiKey: Secrets.apiKey,
  );


  // a better test would be to subscribe to everything and verify that you eventually
  // recieve at least one of each response.
  group('Websocket Feed', () {
    test('Subscription Response', () async {
      wsClient.connect();
      stream = wsClient.subscribe(
        productIds: ['ETH-USD'],
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


  //TODO figure out what to expect
  group('Accounts tests', () {
    late String accountId;

    test('listAccounts', () async {
      var accounts = await accountsClient.listAccounts();
      for (Account account in accounts) {
        if (account.currency == 'BTC') {
          accountId = account.id!;
        }
      }
      expect(accounts.length != 0, true);
    });

    test('getAccount', () async {
      var account = await accountsClient.getAccount(accountId: accountId);
      expect(account.balance! > 0, true);
    });

    test('getHolds', () async {
      var holds = await accountsClient.getHolds(accountId: accountId);
      expect(true, true);
    });

    test('getAccountLedger', () async {
      var ledger = await accountsClient.getAccountLedger(accountId: accountId);
      expect(true, true);
    });

    test('getAccountTransfers', () async {
      var transfers = await accountsClient.getAccountTransfers(accountId: accountId);
      expect(true, true);
    });
  });


  group('Coinbase Accounts', () {
    late String accountId;

    test('getCoinbaseWallets', () async {
      var wallets = await coinbaseAccountsClient.getCoinbaseWallets();
      wallets.forEach((wallet) {
        if (wallet.name == 'BTC Wallet') {
          accountId = wallet.id!;
        }
      });
      expect(wallets.first.currency != null, true);
    });

    test('generateCryptoAddress', () async {
      var cryptoAddress = await coinbaseAccountsClient.generateCryptoAddress(accountId: accountId);
      expect(cryptoAddress.address != null, true);
    });
  });

  group('Conversions', () async {
    test('convertCurrency', () async {

    });

    test('getConversion', () async {

    });
  });
}
