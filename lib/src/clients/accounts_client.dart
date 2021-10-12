import 'dart:convert';
import 'package:coinbase_exchange/coinbase_exchange.dart';
import '../clients/client.dart';
import '../lib/paginator.dart';
import '../models/account.dart';
import '../lib/coinbase_enums.dart';
import '../models/hold.dart';
import '../models/ledger_entry.dart';
import '../models/transfer.dart';
import '../rest_clients/accounts_rest_client.dart';

class AccountsClient extends Client {
  bool sandbox;
  String apiKey;
  String secretKey;
  String passphrase;
  late AccountsRestClient _accountsRestClient;

  AccountsClient({
    this.sandbox = false,
    required this.apiKey,
    required this.secretKey,
    required this.passphrase,
  }) {
    _accountsRestClient = AccountsRestClient(
      sandbox: sandbox,
      apiKey: apiKey,
      secretKey: secretKey,
      passphrase: passphrase,
    );
  }

  /// Get a list of trading accounts from the profile of the API key.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getaccounts
  ///
  Future<List<Account>> listAccounts() async {
    var response = await _accountsRestClient.listAccounts();
    if (response.statusCode != 200) throw response;
    return listDecode(response.body)
        .map((account) => Account.fromJson(account))
        .toList();
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
    var response = await _accountsRestClient.getAccount(accountId: accountId);
    if (response.statusCode != 200) throw response;
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
    var response = await _accountsRestClient.getHolds(
      accountId: accountId,
      before: before,
      after: after,
      limit: limit,
    );

    if (response.statusCode != 200) throw response;

    return Paginator(
      before: response.headers.containsKey('CB-BEFORE')
          ? DateTime.parse(response.headers['CB-BEFORE']!)
          : null,
      after: response.headers.containsKey('CB-AFTER')
          ? DateTime.parse(response.headers['CB-AFTER']!)
          : null,
      elements:
          listDecode(response.body).map((hold) => Hold.fromJson(hold)).toList(),
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
    var response = await _accountsRestClient.getAccountLedger(
      accountId: accountId,
      startDate: startDate,
      endDate: endDate,
      before: before,
      after: after,
      limit: limit,
    );

    if (response.statusCode != 200) throw response;

    return Paginator(
      before: response.headers.containsKey('CB-BEFORE')
          ? DateTime.parse(response.headers['CB-BEFORE']!)
          : null,
      after: response.headers.containsKey('CB-AFTER')
          ? DateTime.parse(response.headers['CB-AFTER']!)
          : null,
      elements: listDecode(response.body)
          .map((hold) => LedgerEntry.fromJson(hold))
          .toList(),
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
    var response = await _accountsRestClient.getAccountTransfers(
      accountId: accountId,
      before: before,
      after: after,
      limit: limit,
      transferType: transferType,
    );

    if (response.statusCode != 200) throw response;

    return Paginator(
      before: response.headers.containsKey('CB-BEFORE')
          ? DateTime.parse(response.headers['CB-BEFORE']!)
          : null,
      after: response.headers.containsKey('CB-AFTER')
          ? DateTime.parse(response.headers['CB-AFTER']!)
          : null,
      elements: listDecode(response.body)
          .map((hold) => Transfer.fromJson(hold))
          .toList(),
    );
  }
}
