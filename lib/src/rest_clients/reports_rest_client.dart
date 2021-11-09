import 'package:coinbase_exchange/src/lib/coinbase_enums.dart';

import '../rest_clients/rest_client.dart';
import 'package:http/http.dart' as http;

/// A [RestClient] that helps manage reports and returns http.Response
/// objects.
class ReportsRestClient extends RestClient {
  ReportsRestClient({
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

  /// Get all reports
  ///
  /// Gets a list of past fills/account reports.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getreports
  ///
  Future<http.Response> getAllReports({
    String? portfolioId,
    DateTime? after,
    int? limit,
    ReportTypeEnum? type,
    bool? ignoreExpired,
  }) async {
    Map<String, dynamic> queryParameters = {};
    if (portfolioId != null) queryParameters['portfolio_id'] = portfolioId;
    if (after != null) queryParameters['after'] = after.toIso8601String();
    if (limit != null) queryParameters['limit'] = limit;
    if (type != null) queryParameters['type'] = type.reportType();
    if (ignoreExpired != null)
      queryParameters['ignore_expired'] = ignoreExpired;

    return get(
      path: '/reports',
      queryParameters: queryParameters,
    );
  }

  /// Create a report
  ///
  /// Generates a report. Reports are either for past account history
  /// or past fills on either all accounts or one product's account.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_postreports
  ///
  Future<http.Response> createReport({
    DateTime? startDate,
    DateTime? endDate,
    required ReportTypeEnum type,
    DateTime? year,
    ReportFormatEnum? format,
    String? productId,
    String? accountId,
    String? email,
    String? profileId,
  }) async {
    Map<String, dynamic> body = {'type': type.reportType()};
    if (startDate != null) body['start_date'] = startDate.toIso8601String();
    if (endDate != null) body['end_date'] = endDate.toIso8601String();
    if (year != null) body['year'] = year.year.toString();
    if (format != null) body['format'] = format.reportFormat();
    if (productId != null) body['product_id'] = productId;
    if (accountId != null) body['account_id'] = accountId;
    if (email != null) body['email'] = email;
    if (profileId != null) body['profile_id'] = profileId;

    return post(
      path: '/reports',
      body: body,
    );
  }

  /// Get a report
  ///
  /// Get a specific report by report_id.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getreport
  ///
  Future<http.Response> getReport({required String? reportId}) async =>
      get(path: '/reports/$reportId');
}
