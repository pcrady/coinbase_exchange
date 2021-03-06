import '../rest_clients/rest_client.dart';
import 'package:http/http.dart' as http;

/// A [RestClient] that helps manage users.
class UsersRestClient extends RestClient {
  UsersRestClient({
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

  /// Get user exchange limits
  ///
  /// Gets exchange limits information for a single user.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getuserexchangelimits
  ///
  Future<http.Response> getUserExchangeLimits({
    required String userId,
  }) async =>
      get(path: '/users/$userId/exchange-limits');
}
