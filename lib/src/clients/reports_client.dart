import 'package:coinbase_dart/src/clients/client.dart';
import 'package:coinbase_dart/src/models/report.dart';
import 'package:coinbase_dart/src/rest_clients/reports_rest_client.dart';
import 'package:logger/logger.dart';
import 'dart:convert';

class ReportsClient extends Client {
  Logger _logger = Logger();
  bool sandbox;
  String apiKey;
  String secretKey;
  String passphrase;
  late ReportsRestClient _reportsRestClient;

  ReportsClient({
    this.sandbox = false,
    required this.apiKey,
    required this.secretKey,
    required this.passphrase,
  }) {
    _reportsRestClient = ReportsRestClient(
      sandbox: sandbox,
      apiKey: apiKey,
      secretKey: secretKey,
      passphrase: passphrase,
    );
  }


  /// Get all reports
  ///
  /// Gets a list of past fills/account reports.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getreports
  ///
  Future<List<Report>> getAllReports({
    String? portfolioId,
    DateTime? after,
    int? limit,
    // TODO make enum
    String? type,
    bool? ignoreExpired,
  }) async {
    var response = await _reportsRestClient.getAllReports(
      portfolioId: portfolioId,
      after: after,
      limit: limit,
      type: type,
      ignoreExpired: ignoreExpired,
    );

    if (response.statusCode != 200) throw response;

    return listDecode(response.body).map((product) => Report.fromJson(product)).toList();
  }

  /// Create a report
  ///
  /// Generates a report. Reports are either for past account history
  /// or past fills on either all accounts or one product's account.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_postreports
  ///
  Future<Map> createReport({
    DateTime? startDate,
    DateTime? endDate,
    //TODO make enum
    required String otcFills,
    DateTime? year,
    //todo make enum
    String? format,
    String? productId,
    String? accountId,
    String? email,
    String? profileId,
  }) async {
    var response = await _reportsRestClient.createReport(
      startDate: startDate,
      endDate: endDate,
      otcFills: otcFills,
      year: year,
      format: format,
      productId: productId,
      accountId: accountId,
      email: email,
      profileId: profileId,
    );

    if (response.statusCode != 200) throw response;

    return json.decode(response.body);
  }

  /// Get a report
  ///
  /// Get a specific report by report_id.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getreport
  ///
  Future<Report> getReport({
    required String? reportId
  }) async {
    var response = await _reportsRestClient.getReport(reportId: reportId);

    if (response.statusCode != 200) throw response;

    return Report.fromJson(json.decode(response.body));
  }
}