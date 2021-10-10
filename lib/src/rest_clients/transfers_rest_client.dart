import 'package:coinbase_dart/src/rest_clients/rest_client.dart';
import 'package:http/http.dart' as http;

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

  Future<http.Response> getAllPaymentMethods() async =>
    get(path: '/deposits/payment-methods');

  Future<http.Response> getAllTransfers() async  =>
    get(path: '/transfers');

  Future<http.Response> getTransfer({
    required String transferId,
  }) async => get(path: '/transfers/$transferId');

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

  Future<http.Response> getFeeEstimateForCryptoWithdrawal({
    String? currency,
    String? cryptoAddress,
  }) async {
    Map<String, String> queryParameters = {};
    if (currency != null) queryParameters['currency'] = currency;
    if (cryptoAddress != null) queryParameters['crypto_address'] = cryptoAddress;

    return get(
      path: '/withdrawals/fee-estimate',
      queryParameters: queryParameters,
    );
  }

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