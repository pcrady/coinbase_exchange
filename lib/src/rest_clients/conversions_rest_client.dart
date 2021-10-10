import 'package:coinbase_dart/src/rest_clients/rest_client.dart';
import 'package:coinbase_dart/coinbase_dart.dart';
import 'package:http/http.dart' as http;

class ConversionsRestClient extends CoinbaseRestClient {
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

  Future<http.Response> getConversion({
    required String conversionId,
  }) async => get(path: '/conversions/$conversionId');
}