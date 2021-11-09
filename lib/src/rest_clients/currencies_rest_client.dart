import '../rest_clients/rest_client.dart';
import 'package:http/http.dart' as http;

/// A [RestClient] that helps manage currencies and returns http.Response
/// objects.
class CurrenciesRestClient extends RestClient {
  CurrenciesRestClient({
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

  Future<http.Response> getAllCurrencies() async => get(path: '/currencies');

  Future<http.Response> getCurrency({
    required String currencyId,
  }) async =>
      get(path: '/currencies/$currencyId');
}
