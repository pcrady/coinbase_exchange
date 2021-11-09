import '../rest_clients/rest_client.dart';
import 'package:http/http.dart' as http;

/// A [RestClient] that helps manage the coinbase price oracle and
/// returns http.Response objects.
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

  Future<http.Response> getSignedPrices() async => get(path: '/oracle');
}
