import '../rest_clients/rest_client.dart';
import 'package:http/http.dart' as http;

/// A [RestClient] that helps manage transfers and returns http.Response
/// objects.
class TransfersRestClient extends RestClient {
  TransfersRestClient({
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

  /// Deposit from Coinbase account
  ///
  /// Deposits funds from a www.coinbase.com wallet to the specified profile_id.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_postdepositcoinbaseaccount
  ///
  Future<http.Response> depositFromCoinbaseAccount({
    String? profileId,
    required double amount,
    required String coinbaseAccountId,
    required String currency,
  }) async {
    Map<String, String> body = {
      'amount': amount.toString(),
      'coinbase_account_id': coinbaseAccountId,
      'currency': currency,
    };
    if (profileId != null) body['profile_id'] = profileId;

    return post(
      path: '/deposits/coinbase-account',
      body: body,
    );
  }

  /// Deposit from payment method
  ///
  /// Deposits funds from a linked external payment method to the specified profile_id.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_postdepositpaymentmethod
  ///
  Future<http.Response> depositFromPaymentMethod({
    String? profileId,
    required double amount,
    required String paymentMethodId,
    required String currency,
  }) async {
    Map<String, String> body = {
      'amount': amount.toString(),
      'payment_method_id': paymentMethodId,
      'currency': currency,
    };
    if (profileId != null) body['profile_id'] = profileId;

    return post(
      path: '/deposits/payment-method',
      body: body,
    );
  }

  /// Get all payment methods
  ///
  /// Gets a list of the user's linked payment methods.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getpaymentmethods
  ///
  Future<http.Response> getAllPaymentMethods() async =>
      get(path: '/deposits/payment-methods');

  /// Get all transfers
  ///
  /// Gets a list of in-progress and completed transfers of funds in/out of any of the user's accounts.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_gettransfers
  ///
  Future<http.Response> getAllTransfers() async => get(path: '/transfers');

  /// Get a single transfer
  ///
  /// Get information on a single transfer.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_gettransfer
  ///
  Future<http.Response> getTransfer({
    required String transferId,
  }) async =>
      get(path: '/transfers/$transferId');

  /// Withdraw to Coinbase account
  ///
  /// Withdraws funds from the specified profile_id to a www.coinbase.com wallet.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_postwithdrawcoinbaseaccount
  ///
  Future<http.Response> withdrawToCoinbaseAccount({
    String? profileId,
    required double amount,
    required String coinbaseAccountId,
    required String currency,
  }) async {
    Map<String, String> body = {
      'amount': amount.toString(),
      'coinbase_account_id': coinbaseAccountId,
      'currency': currency,
    };
    if (profileId != null) body['profile_id'] = profileId;

    return post(
      path: '/withdrawals/coinbase-account',
      body: body,
    );
  }

  /// Withdraw to crypto address
  ///
  /// Withdraws funds from the specified profile_id to an external crypto address
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_postwithdrawcrypto
  ///
  Future<http.Response> withdrawToCryptoAddress({
    String? profileId,
    required double amount,
    required String currency,
    required String cryptoAddress,
    String? destinationTag,
    bool? noDestinationTag,
    String? twoFactorCode,
    int? nonce,
    String? fee,
  }) async {
    Map<String, dynamic> body = {
      'amount': amount,
      'currency': currency,
      'crypto_address': cryptoAddress,
    };
    if (profileId != null) body['profile_id'] = profileId;
    if (profileId != null) body['destination_tag'] = destinationTag;
    if (profileId != null) body['no_destination_tag'] = noDestinationTag;
    if (profileId != null) body['two_factor_code'] = twoFactorCode;
    if (profileId != null) body['nonce'] = nonce;
    if (profileId != null) body['fee'] = fee;

    return post(
      path: '/withdrawals/crypto',
      body: body,
    );
  }

  /// Get fee estimate for crypto withdrawal
  ///
  /// Gets the fee estimate for the crypto withdrawal to crypto address
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getwithdrawfeeestimate
  ///
  Future<http.Response> getFeeEstimateForCryptoWithdrawal({
    String? currency,
    String? cryptoAddress,
  }) async {
    Map<String, String> queryParameters = {};
    if (currency != null) queryParameters['currency'] = currency;
    if (cryptoAddress != null)
      queryParameters['crypto_address'] = cryptoAddress;

    return get(
      path: '/withdrawals/fee-estimate',
      queryParameters: queryParameters,
    );
  }

  /// Withdraw to payment method
  ///
  /// Withdraws funds from the specified profile_id to a linked external payment method
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_postwithdrawpaymentmethod
  ///
  Future<http.Response> withdrawToPaymentMethod({
    String? profileId,
    required double amount,
    required String paymentMethodId,
    required String currency,
  }) async {
    Map<String, String> body = {
      'amount': amount.toString(),
      'payment_method_id': paymentMethodId,
      'currency': currency,
    };
    if (profileId != null) body['profile_id'] = profileId;

    return post(
      path: '/withdrawals/payment-method',
      body: body,
    );
  }
}
