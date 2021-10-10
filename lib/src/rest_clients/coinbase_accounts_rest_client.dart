import 'package:coinbase_dart/src/rest_clients/rest_client.dart';
import 'package:coinbase_dart/coinbase_dart.dart';
import 'package:http/http.dart' as http;

class CoinbaseAccountsRestClient extends CoinbaseRestClient {
  CoinbaseAccountsRestClient({
    bool sandbox = false,
    required String apiKey,
    required String secretKey,
    required String passphrase,
  }) : super(
    sandbox: sandbox,
    apiKey: apiKey,
    secretKey: secretKey,
    passphrase: passphrase,
  );

  Future<http.Response> getCoinbaseWallets() async =>
    get(path: '/coinbase-accounts');

  Future<http.Response> generateCryptoAddress({
    required String accountId,
  }) async => post(path: '/coinbase-accounts/$accountId/addresses');
}