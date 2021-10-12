import '../clients/client.dart';
import '../rest_clients/users_rest_client.dart';
import 'dart:convert';

class UsersClient extends Client {
  bool sandbox;
  String apiKey;
  String secretKey;
  String passphrase;
  late UsersRestClient _usersRestClient;

  UsersClient({
    this.sandbox = false,
    required this.apiKey,
    required this.secretKey,
    required this.passphrase,
  }) {
    _usersRestClient = UsersRestClient(
      sandbox: sandbox,
      apiKey: apiKey,
      secretKey: secretKey,
      passphrase: passphrase,
    );
  }

  /// Get user exchange limits
  ///
  /// Gets exchange limits information for a single user.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getuserexchangelimits
  ///
  Future<Map> getUserExchangeLimits({
    required String userId,
  }) async {
    var response = await _usersRestClient.getUserExchangeLimits(userId: userId);

    if (response.statusCode != 200) throw response;

    return json.decode(response.body);
  }
}