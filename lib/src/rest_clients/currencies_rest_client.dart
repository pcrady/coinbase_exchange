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

  /// Get all known currencies
  ///
  /// Gets a list of all known currencies.
  /// Note: Not all currencies may be currently in use for trading.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getcurrencies
  ///
  Future<http.Response> getAllCurrencies() async => get(path: '/currencies');

  /// Get a currency
  ///
  /// Gets a single currency by id. Currency codes will conform to the ISO 4217 standard
  /// where possible. Currencies which have or had no representation in ISO 4217
  /// may use a custom code.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getcurrency
  ///
  Future<http.Response> getCurrency({
    required String currencyId,
  }) async =>
      get(path: '/currencies/$currencyId');
}
