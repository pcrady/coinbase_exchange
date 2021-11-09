import 'package:coinbase_exchange/coinbase_exchange.dart';
import '../lib/coinbase_enums.dart';
import '../rest_clients/rest_client.dart';
import 'package:http/http.dart' as http;

/// A [RestClient] that helps manage accounts and returns
/// http.Response objects.
class AccountsRestClient extends RestClient {
  AccountsRestClient({
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

  /// Get a list of trading accounts from the profile of the API key.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getaccounts
  ///
  Future<http.Response> listAccounts() async => get(path: '/accounts');

  /// Get a single account by id
  ///
  /// Information for a single account. Use this endpoint when you know the account_id.
  /// API key must belong to the same profile as the account.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getaccount
  ///
  Future<http.Response> getAccount({
    required String accountId,
  }) async =>
      get(path: '/accounts/$accountId');

  /// Get a single account's holds
  ///
  /// List the holds of an account that belong to the same profile as the API key.
  /// Holds are placed on an account for any active orders or pending withdraw
  /// requests. As an order is filled, the hold amount is updated. If an order
  /// is canceled, any remaining hold is removed. For withdrawals, the hold is
  /// removed after it is completed.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getaccountholds
  ///
  Future<http.Response> getHolds({
    required String accountId,
    DateTime? before,
    DateTime? after,
    int? limit,
  }) async {
    Map<String, String> queryParameters = {};
    if (before != null) queryParameters['before'] = before.toIso8601String();
    if (after != null) queryParameters['after'] = after.toIso8601String();
    if (limit != null) queryParameters['limit'] = limit.toString();

    return get(
      path: '/accounts/$accountId/holds',
      queryParameters: queryParameters,
    );
  }

  /// Get a single account's ledger
  ///
  /// Lists ledger activity for an account. This includes anything that would
  /// affect the accounts balance - transfers, trades, fees, etc.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getaccountledger
  ///
  Future<http.Response> getAccountLedger({
    required String accountId,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? before,
    DateTime? after,
    int? limit,
  }) async {
    Map<String, String> queryParameters = {};
    if (startDate != null)
      queryParameters['start_date'] = startDate.toIso8601String();
    if (endDate != null)
      queryParameters['end_date'] = endDate.toIso8601String();
    if (before != null) queryParameters['before'] = before.toIso8601String();
    if (after != null) queryParameters['after'] = after.toIso8601String();
    if (limit != null) queryParameters['limit'] = limit.toString();

    return get(
      path: '/accounts/$accountId/ledger',
      queryParameters: queryParameters,
    );
  }

  /// Get a single account's transfers
  ///
  /// Lists past withdrawals and deposits for an account.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getaccounttransfers
  Future<http.Response> getAccountTransfers({
    required String accountId,
    DateTime? before,
    DateTime? after,
    int? limit,
    TransferEnum? transferType,
  }) async {
    Map<String, String> queryParameters = {};
    if (before != null) queryParameters['before'] = before.toIso8601String();
    if (after != null) queryParameters['after'] = after.toIso8601String();
    if (limit != null) queryParameters['limit'] = limit.toString();
    if (transferType != null)
      queryParameters['type'] = transferType.transferType();

    return get(
      path: '/accounts/$accountId/transfers',
      queryParameters: queryParameters,
    );
  }
}
