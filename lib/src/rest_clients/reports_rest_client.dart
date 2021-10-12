import '../rest_clients/rest_client.dart';
import 'package:http/http.dart' as http;

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

  Future<http.Response> getAllReports({
    String? portfolioId,
    DateTime? after,
    int? limit,
    // TODO make enum
    String? type,
    bool? ignoreExpired,
  }) async {
    Map<String, dynamic> queryParameters = {};
    if (portfolioId != null) queryParameters['portfolio_id'] = portfolioId;
    if (after != null) queryParameters['after'] = after.toIso8601String();
    if (limit != null) queryParameters['limit'] = limit;
    if (type != null) queryParameters['type'] = type;
    if (ignoreExpired != null)
      queryParameters['ignore_expired'] = ignoreExpired;

    return get(
      path: '/reports',
      queryParameters: queryParameters,
    );
  }

  Future<http.Response> createReport({
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
    Map<String, dynamic> body = {'otc_fills': otcFills};
    if (startDate != null) body['start_date'] = startDate.toIso8601String();
    if (endDate != null) body['end_date'] = endDate.toIso8601String();
    if (year != null) body['year'] = year.year.toString();
    if (format != null) body['format'] = format;
    if (productId != null) body['product_id'] = productId;
    if (accountId != null) body['account_id'] = accountId;
    if (email != null) body['email'] = email;
    if (profileId != null) body['profile_id'] = profileId;

    return post(
      path: '/reports',
      body: body,
    );
  }

  Future<http.Response> getReport({required String? reportId}) async =>
      get(path: '/reports/$reportId');
}
