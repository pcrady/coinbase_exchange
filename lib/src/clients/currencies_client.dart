import '../clients/client.dart';
import '../models/currency.dart';
import '../rest_clients/currencies_rest_client.dart';

/// A [Client] that helps manage currencies and returns coinbase_exchange
/// objects
class CurrenciesClient extends Client {
  bool sandbox;
  String apiKey;
  String secretKey;
  String passphrase;
  late CurrenciesRestClient _currenciesRestClient;

  CurrenciesClient({
    this.sandbox = false,
    required this.apiKey,
    required this.secretKey,
    required this.passphrase,
  }) {
    _currenciesRestClient = CurrenciesRestClient(
      sandbox: sandbox,
      apiKey: apiKey,
      secretKey: secretKey,
      passphrase: passphrase,
    );
  }

  /// Get all known currencies
  ///
  /// Gets a list of all known currencies.
  /// Note: Not all currencies may be currently in use for trading.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getcurrencies
  ///
  Future<List<Currency>> getAllCurrencies() async {
    var response = await _currenciesRestClient.getAllCurrencies();

    if (response.statusCode != 200) throw response;

    return listDecode(response.body)
        .map((currency) => Currency.fromJson(currency))
        .toList();
  }

  /// Get a currency
  ///
  /// Gets a single currency by id. Currency codes will conform to the ISO 4217 standard
  /// where possible. Currencies which have or had no representation in ISO 4217
  /// may use a custom code.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getcurrency
  ///
  Future<Currency> getCurrency({
    required String currencyId,
  }) async {
    var response =
        await _currenciesRestClient.getCurrency(currencyId: currencyId);

    if (response.statusCode != 200) throw response;

    return Currency.fromJson(mapDecode(response.body));
  }
}
