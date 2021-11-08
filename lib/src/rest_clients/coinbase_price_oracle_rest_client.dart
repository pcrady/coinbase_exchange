import '../rest_clients/rest_client.dart';
import 'package:http/http.dart' as http;

class CoinbasePriceOracleRestClient extends RestClient {
  CoinbasePriceOracleRestClient({
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

  Future<http.Response> getSignedPrices() async =>
    get(path: '/oracle');
}