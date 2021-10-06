import 'package:coinbase_dart/src/rest_clients/coinbase_rest_client.dart';
import 'package:coinbase_dart/coinbase_dart.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class CoinbaseAccountsRestClient extends CoinbaseRestClient {
  Logger _logger = Logger();

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

  Future<http.Response> getCoinbaseWallets() async => await get(path: '/coinbase-accounts');

  Future<http.Response> generateCryptoAddress({
    required String accountId,
  }) async => await post(path: '/coinbase-accounts/$accountId/addresses');
}