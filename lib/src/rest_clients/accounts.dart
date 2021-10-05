import 'dart:convert';
import 'package:coinbase_dart/coinbase_dart.dart';
import 'package:coinbase_dart/src/lib/paginator.dart';
import 'package:coinbase_dart/src/models/account.dart';
import 'package:coinbase_dart/src/lib/coinbase_enums.dart';
import 'package:coinbase_dart/src/models/hold.dart';
import 'package:coinbase_dart/src/models/ledger_entry.dart';
import 'package:coinbase_dart/src/models/transfer.dart';
import 'package:logger/logger.dart';


class AccountsClient extends CoinbaseRestClient {
  Logger _logger = Logger();

  AccountsClient({
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
  Future<List<Account>> listAccounts() async {
    var response = await get(path: '/accounts');
    if (response.statusCode != 200) {
      throw response;
    }
    return listDecode(response.body).map((account) => Account.fromJson(account)).toList();
  }

  /// Get a single account by id
  ///
  /// Information for a single account. Use this endpoint when you know the account_id.
  /// API key must belong to the same profile as the account.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getaccount
  ///
  Future<Account> getAccount({
    required String accountId,
  }) async {
    var response = await get(path: '/accounts/$accountId');
    if (response.statusCode != 200) {
      throw response;
    }
    return Account.fromJson(json.decode(response.body));
  }

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
  Future<Paginator<Hold, DateTime>> getHolds({
    required String accountId,
    DateTime? before,
    DateTime? after,
    int? limit,
  }) async {
    Map<String, String> queryParameters = {};
    if (before != null) queryParameters['before'] = before.toIso8601String();
    if (after != null) queryParameters['after'] = after.toIso8601String();
    if (limit != null) queryParameters['limit'] = limit.toString();

    var response = await get(
      path: '/accounts/$accountId/holds',
      queryParameters: queryParameters,
    );

    if (response.statusCode != 200) {
      _logger.i(response.statusCode);
      throw response;
    }

    return Paginator(
      before: response.headers.containsKey('CB-BEFORE') ? DateTime.parse(response.headers['CB-BEFORE']!) : null,
      after: response.headers.containsKey('CB-AFTER') ? DateTime.parse(response.headers['CB-AFTER']!) : null,
      elements: listDecode(response.body).map((hold) => Hold.fromJson(hold)).toList(),
    );
  }

  /// Get a single account's ledger
  ///
  /// Lists ledger activity for an account. This includes anything that would
  /// affect the accounts balance - transfers, trades, fees, etc.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getaccountledger
  ///
  Future<Paginator<LedgerEntry, DateTime>> getAccountLedger({
    required String accountId,
    DateTime? startDate,
    DateTime? endDate,
    DateTime? before,
    DateTime? after,
    int? limit,
  }) async {
    Map<String, String> queryParameters = {};
    if (startDate != null) queryParameters['start_date'] = startDate.toIso8601String();
    if (endDate != null) queryParameters['end_date'] = endDate.toIso8601String();
    if (before != null) queryParameters['before'] = before.toIso8601String();
    if (after != null) queryParameters['after'] = after.toIso8601String();
    if (limit != null) queryParameters['limit'] = limit.toString();

    var response = await get(
      path: '/accounts/$accountId/ledger',
      queryParameters: queryParameters,
    );
    if (response.statusCode != 200) {
      throw response;
    }
    return Paginator(
      before: response.headers.containsKey('CB-BEFORE') ? DateTime.parse(response.headers['CB-BEFORE']!) : null,
      after: response.headers.containsKey('CB-AFTER') ? DateTime.parse(response.headers['CB-AFTER']!) : null,
      elements: listDecode(response.body).map((hold) => LedgerEntry.fromJson(hold)).toList(),
    );
  }

  /// Get a single account's transfers
  ///
  /// Lists past withdrawals and deposits for an account.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getaccounttransfers
  Future<Paginator<Transfer, DateTime>> getAccountTransfers({
    required String accountId,
    DateTime? before,
    DateTime? after,
    int? limit,
    CoinbaseTransferType? transferType,
  }) async {
    Map<String, String> queryParameters = {};
    if (before != null) queryParameters['before'] = before.toIso8601String();
    if (after != null) queryParameters['after'] = after.toIso8601String();
    if (limit != null) queryParameters['limit'] = limit.toString();
    if (transferType != null) queryParameters['type'] = transferType.transferType();

    var response = await get(
      path: '/accounts/$accountId/transfers',
      queryParameters: queryParameters,
    );
    if (response.statusCode != 200) {
      throw response;
    }
    return Paginator(
      before: response.headers.containsKey('CB-BEFORE') ? DateTime.parse(response.headers['CB-BEFORE']!) : null,
      after: response.headers.containsKey('CB-AFTER') ? DateTime.parse(response.headers['CB-AFTER']!) : null,
      elements: listDecode(response.body).map((hold) => Transfer.fromJson(hold)).toList(),
    );
  }
}

