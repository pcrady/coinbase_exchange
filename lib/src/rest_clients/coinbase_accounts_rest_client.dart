import '../rest_clients/rest_client.dart';
import 'package:http/http.dart' as http;

/// A [RestClient] that helps manage accounts on counbase.com **NOT** coinbase pro
/// and returns http.Response objects.
class CoinbaseAccountsRestClient extends RestClient {
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

  /// Get all Coinbase wallets
  ///
  /// Gets all the user's available Coinbase wallets
  /// (These are the wallets/accounts that are used for
  /// buying and selling on www.coinbase.com)
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getcoinbaseaccounts
  ///
  Future<http.Response> getCoinbaseWallets() async =>
      get(path: '/coinbase-accounts');

  /// Generate crypto address
  ///
  /// Generates a one-time crypto address for depositing crypto.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_postcoinbaseaccountaddresses
  ///
  Future<http.Response> generateCryptoAddress({
    required String accountId,
  }) async =>
      post(path: '/coinbase-accounts/$accountId/addresses');
}
