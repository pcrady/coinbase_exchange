import 'package:coinbase_exchange/coinbase_exchange.dart';
import 'package:coinbase_exchange/src/models/payment_method.dart';
import 'package:coinbase_exchange/src/models/transaction.dart';
import 'dart:convert';

import '../clients/client.dart';
import '../rest_clients/transfers_rest_client.dart';

/// A [Client] that helps manage transfers and returns coinbase_exchange
/// objects
class TransfersClient extends Client {
  bool sandbox;
  String apiKey;
  String secretKey;
  String passphrase;
  late TransfersRestClient _transfersRestClient;

  TransfersClient({
    this.sandbox = false,
    required this.apiKey,
    required this.secretKey,
    required this.passphrase,
  }) {
    _transfersRestClient = TransfersRestClient(
      sandbox: sandbox,
      apiKey: apiKey,
      secretKey: secretKey,
      passphrase: passphrase,
    );
  }

  /// Deposit from Coinbase account
  ///
  /// Deposits funds from a www.coinbase.com wallet to the specified profile_id.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_postdepositcoinbaseaccount
  ///
  Future<Transaction> depositFromCoinbaseAccount({
    String? profileId,
    required double amount,
    required String coinbaseAccountId,
    required String currency,
  }) async {
    var response = await _transfersRestClient.depositFromCoinbaseAccount(
      profileId: profileId,
      amount: amount,
      coinbaseAccountId: coinbaseAccountId,
      currency: currency,
    );

    if (response.statusCode != 200) throw response;

    return Transaction.fromJson(json.decode(response.body));
  }

  /// Deposit from payment method
  ///
  /// Deposits funds from a linked external payment method to the specified profile_id.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_postdepositpaymentmethod
  ///
  Future<Transaction> depositFromPaymentMethod({
    String? profileId,
    required double amount,
    required String paymentMethodId,
    required String currency,
  }) async {
    var response = await _transfersRestClient.depositFromPaymentMethod(
      profileId: profileId,
      amount: amount,
      paymentMethodId: paymentMethodId,
      currency: currency,
    );

    if (response.statusCode != 200) throw response;

    return Transaction.fromJson(json.decode(response.body));
  }

  /// Get all payment methods
  ///
  /// Gets a list of the user's linked payment methods.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getpaymentmethods
  ///
  Future<List<PaymentMethod>> getAllPaymentMethods() async {
    var response = await _transfersRestClient.getAllPaymentMethods();

    if (response.statusCode != 200) throw response;

    return listDecode(response.body)
      .map((method) => PaymentMethod.fromJson(method))
      .toList();
  }

  /// Get all transfers
  ///
  /// Gets a list of in-progress and completed transfers of funds in/out of any of the user's accounts.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_gettransfers
  ///
  Future<List<Transfer>> getAllTransfers() async {
    var response = await _transfersRestClient.getAllTransfers();

    if (response.statusCode != 200) throw response;

    return listDecode(response.body)
      .map((transfer) => Transfer.fromJson(transfer))
      .toList();
  }

  /// Get a single transfer
  ///
  /// Get information on a single transfer.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_gettransfer
  ///
  Future<Transfer> getTransfer({
    required String transferId,
  }) async {
    var response = await _transfersRestClient.getTransfer(transferId: transferId);

    if (response.statusCode != 200) throw response;

    return Transfer.fromJson(json.decode(response.body));
  }

  /// Withdraw to Coinbase account
  ///
  /// Withdraws funds from the specified profile_id to a www.coinbase.com wallet.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_postwithdrawcoinbaseaccount
  ///
  Future<Transaction> withdrawToCoinbaseAccount({
    String? profileId,
    required double amount,
    required String coinbaseAccountId,
    required String currency,
  }) async {
    var response = await _transfersRestClient.withdrawToCoinbaseAccount(
      profileId: profileId,
      amount: amount,
      coinbaseAccountId: coinbaseAccountId,
      currency: currency,
    );

    if (response.statusCode != 200) throw response;

    return Transaction.fromJson(json.decode(response.body));
  }

  /// Withdraw to crypto address
  ///
  /// Withdraws funds from the specified profile_id to an external crypto address
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_postwithdrawcrypto
  ///
  Future<Transaction> withdrawToCryptoAddress({
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
    var response = await _transfersRestClient.withdrawToCryptoAddress(
      profileId: profileId,
      amount: amount,
      currency: currency,
      cryptoAddress: cryptoAddress,
      destinationTag: destinationTag,
      noDestinationTag: noDestinationTag,
      twoFactorCode: twoFactorCode,
      nonce: nonce,
      fee: fee,
    );

    if (response.statusCode != 200) throw response;

    return Transaction.fromJson(json.decode(response.body));
  }

  /// Get fee estimate for crypto withdrawal
  ///
  /// Gets the fee estimate for the crypto withdrawal to crypto address
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getwithdrawfeeestimate
  ///
  Future<double> getFeeEstimateForCryptoWithdrawal({
    String? currency,
    String? cryptoAddress,
  }) async {
    var response = await _transfersRestClient.getFeeEstimateForCryptoWithdrawal(
      currency: currency,
      cryptoAddress: cryptoAddress,
    );

    if (response.statusCode != 200) throw response;

    var decodedResponse = json.decode(response.body);
    return double.tryParse(decodedResponse['fee'])!;
  }

  /// Withdraw to payment method
  ///
  /// Withdraws funds from the specified profile_id to a linked external payment method
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_postwithdrawpaymentmethod
  ///
  Future<Transaction> withdrawToPaymentMethod({
    String? profileId,
    required double amount,
    required String paymentMethodId,
    required String currency,
  }) async {
    var response = await _transfersRestClient.withdrawToPaymentMethod(
      profileId: profileId,
      amount: amount,
      paymentMethodId: paymentMethodId,
      currency: currency,
    );

    if (response.statusCode != 200) throw response;

    return Transaction.fromJson(json.decode(response.body));
  }
}
