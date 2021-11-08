import '../clients/client.dart';
import '../models/conversion.dart';
import '../rest_clients/conversions_rest_client.dart';

/// A [Client] that helps manage currency conversions and
/// returns coinbase_exchange objects
class ConversionsClient extends Client {
  bool sandbox;
  String apiKey;
  String secretKey;
  String passphrase;
  late ConversionsRestClient _conversionsRestClient;

  ConversionsClient({
    this.sandbox = false,
    required this.apiKey,
    required this.secretKey,
    required this.passphrase,
  }) {
    _conversionsRestClient = ConversionsRestClient(
      sandbox: sandbox,
      apiKey: apiKey,
      secretKey: secretKey,
      passphrase: passphrase,
    );
  }

  /// Convert a currency
  ///
  /// Converts funds from from currency to to currency.
  /// Funds are converted on the from account in the profile_id profile.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_postconversion
  ///
  Future<Conversion> convertCurrency({
    String? profileId,
    required String from,
    required String to,
    required double amount,
    String? nonce,
  }) async {
    var response = await _conversionsRestClient.convertCurrency(
      profileId: profileId,
      from: from,
      to: to,
      amount: amount,
      nonce: nonce,
    );

    if (response.statusCode != 200) throw response;

    return Conversion.fromJson(mapDecode(response.body));
  }

  /// Get a conversion
  ///
  /// Gets a currency conversion by id (i.e. USD -> USDC).
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getconversion
  ///
  Future<Conversion> getConversion({
    required String conversionId,
  }) async {
    var response =
        await _conversionsRestClient.getConversion(conversionId: conversionId);

    if (response.statusCode != 200) throw response;

    return Conversion.fromJson(mapDecode(response.body));
  }
}
