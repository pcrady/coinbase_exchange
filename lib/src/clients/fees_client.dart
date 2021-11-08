import 'package:coinbase_exchange/src/models/fees.dart';
import 'package:coinbase_exchange/src/rest_clients/fees_rest_client.dart';
import 'dart:convert';

import '../clients/client.dart';

/// A [Client] that helps manage transfers and returns coinbase_exchange
/// objects
class FeesClient extends Client {
  bool sandbox;
  String apiKey;
  String secretKey;
  String passphrase;
  late FeesRestClient _feesRestClient;

  FeesClient({
    this.sandbox = false,
    required this.apiKey,
    required this.secretKey,
    required this.passphrase,
  }) {
    _feesRestClient = FeesRestClient(
      sandbox: sandbox,
      apiKey: apiKey,
      secretKey: secretKey,
      passphrase: passphrase,
    );
  }

  /// Get fees
  ///
  /// Get fees rates and 30 days trailing volume.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getfees
  ///
  Future<Fees> getFees() async {
    var response = await _feesRestClient.getFees();

    if (response.statusCode != 200) throw response;

    return Fees.fromJson(json.decode(response.body));
  }
}