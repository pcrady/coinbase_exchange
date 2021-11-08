import '../clients/client.dart';
import '../models/crypto_address.dart';
import '../models/wallet.dart';
import '../rest_clients/coinbase_accounts_rest_client.dart';

/// A [Client] that helps manage accounts on counbase.com **NOT** coinbase pro
/// and returns coinbase_exchange objects
class CoinbaseAccountsClient extends Client {
  bool sandbox;
  String apiKey;
  String secretKey;
  String passphrase;
  late CoinbaseAccountsRestClient _coinbaseAccountsRestClient;

  CoinbaseAccountsClient({
    this.sandbox = false,
    required this.apiKey,
    required this.secretKey,
    required this.passphrase,
  }) {
    _coinbaseAccountsRestClient = CoinbaseAccountsRestClient(
      sandbox: sandbox,
      apiKey: apiKey,
      secretKey: secretKey,
      passphrase: passphrase,
    );
  }

  /// Get all Coinbase wallets
  ///
  /// Gets all the user's available Coinbase wallets
  /// (These are the wallets/accounts that are used for
  /// buying and selling on www.coinbase.com)
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getcoinbaseaccounts
  ///
  Future<List<Wallet>> getCoinbaseWallets() async {
    var response = await _coinbaseAccountsRestClient.getCoinbaseWallets();

    if (response.statusCode != 200) throw response;
    return listDecode(response.body)
        .map((hold) => Wallet.fromJson(hold))
        .toList();
  }

  /// Generate crypto address
  ///
  /// Generates a one-time crypto address for depositing crypto.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_postcoinbaseaccountaddresses
  ///
  Future<CryptoAddress> generateCryptoAddress({
    required String accountId,
  }) async {
    var response = await _coinbaseAccountsRestClient.generateCryptoAddress(
        accountId: accountId);

    if (response.statusCode != 200) throw response;

    return CryptoAddress.fromJson(mapDecode(response.body));
  }
}
