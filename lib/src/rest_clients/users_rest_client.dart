import 'package:coinbase_exchange/src/rest_clients/rest_client.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

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

  Future<http.Response> getUserExchangeLimits({
    required String userId,
  }) async => get(path: '/users/$userId/exchange-limits');
}