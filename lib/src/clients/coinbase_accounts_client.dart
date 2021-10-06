import 'package:coinbase_dart/src/clients/client.dart';
import 'package:coinbase_dart/src/rest_clients/accounts_rest_client.dart';
import 'package:logger/logger.dart';

class CoinbaseAccountsClient extends Client {
  Logger _logger = Logger();
  bool sandbox;
  String apiKey;
  String secretKey;
  String passphrase;
  late AccountsRestClient _accountsRestClient;

  CoinbaseAccountsClient({
    this.sandbox = false,
    required this.apiKey,
    required this.secretKey,
    required this.passphrase,
  }) {
    _accountsRestClient = AccountsRestClient(
      sandbox: sandbox,
      apiKey: apiKey,
      secretKey: secretKey,
      passphrase: passphrase,
    );
  }

}