import '../rest_clients/rest_client.dart';
import 'package:http/http.dart' as http;

/// A [RestClient] that helps manage currency conversions and
/// returns http.Response objects.
class ConversionsRestClient extends RestClient {
  ConversionsRestClient({
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

  /// Convert a currency
  ///
  /// Converts funds from from currency to to currency.
  /// Funds are converted on the from account in the profile_id profile.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_postconversion
  ///
  Future<http.Response> convertCurrency({
    String? profileId,
    required String from,
    required String to,
    required double amount,
    String? nonce,
  }) async {
    Map<String, String> body = {
      'from': from,
      'to': to,
      'amount': amount.toString(),
    };
    if (profileId != null) body['profile_id'] = profileId;
    if (nonce != null) body['nonce'] = nonce;

    return post(
      path: '/conversions',
      body: body,
    );
  }

  /// Get a conversion
  ///
  /// Gets a currency conversion by id (i.e. USD -> USDC).
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getconversion
  ///
  Future<http.Response> getConversion({
    required String conversionId,
  }) async =>
      get(path: '/conversions/$conversionId');
}
