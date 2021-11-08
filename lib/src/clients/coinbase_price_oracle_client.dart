import 'package:coinbase_exchange/src/models/signed_prices.dart';
import 'package:coinbase_exchange/src/rest_clients/coinbase_price_oracle_rest_client.dart';
import 'dart:convert';

import '../clients/client.dart';

/// A [Client] that helps manage the coinbase price oracle and coinbase_exchange
/// objects
class CoinbasePriceOracleClient extends Client {
  bool sandbox;
  String apiKey;
  String secretKey;
  String passphrase;
  late CoinbasePriceOracleRestClient _coinbasePriceOracleRestClient;

  CoinbasePriceOracleClient({
    this.sandbox = false,
    required this.apiKey,
    required this.secretKey,
    required this.passphrase,
  }) {
    _coinbasePriceOracleRestClient = CoinbasePriceOracleRestClient(
      sandbox: sandbox,
      apiKey: apiKey,
      secretKey: secretKey,
      passphrase: passphrase,
    );
  }

  /// Get signed prices
  ///
  /// Get cryptographically signed prices ready to be posted on-chain using Compound's
  /// Open Oracle smart contract.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getcoinbasepriceoracle
  ///
  Future<SignedPrices> getSignedPrices() async {
    var response = await _coinbasePriceOracleRestClient.getSignedPrices();

    if (response.statusCode != 200) throw response;

    return SignedPrices.fromJson(json.decode(response.body));
  }
}