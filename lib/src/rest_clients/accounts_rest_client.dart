import 'package:coinbase_dart/coinbase_dart.dart';
import 'package:coinbase_dart/src/lib/coinbase_enums.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;


class AccountsRestClient extends CoinbaseRestClient {
  Logger _logger = Logger();

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


  Future<http.Response> listAccounts() async => await get(path: '/accounts');

  Future<http.Response> getAccount({
    required String accountId,
  }) async => await get(path: '/accounts/$accountId');


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

    return await get(
      path: '/accounts/$accountId/holds',
      queryParameters: queryParameters,
    );
  }


  Future<http.Response> getAccountLedger({
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

    return await get(
      path: '/accounts/$accountId/ledger',
      queryParameters: queryParameters,
    );
  }

  Future<http.Response> getAccountTransfers({
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

    return await get(
      path: '/accounts/$accountId/transfers',
      queryParameters: queryParameters,
    );
  }
}

