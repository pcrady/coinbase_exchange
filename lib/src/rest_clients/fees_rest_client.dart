import '../rest_clients/rest_client.dart';
import 'package:http/http.dart' as http;

/// A [RestClient] that helps manage fees and returns [http.Response] objects.
class FeesRestClient extends RestClient {
  FeesRestClient({
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

  /// Get fees
  ///
  /// Get fees rates and 30 days trailing volume.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getfees
  ///
  Future<http.Response> getFees() async => get(path: '/fees');
}
