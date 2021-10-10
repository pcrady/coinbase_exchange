import 'dart:html';

import 'package:coinbase_dart/coinbase_dart.dart';
import 'package:coinbase_dart/src/clients/client.dart';
import 'package:coinbase_dart/src/lib/paginator.dart';
import 'package:coinbase_dart/src/rest_clients/products_rest_client.dart';
import 'package:coinbase_dart/src/rest_clients/profiles_rest_client.dart';
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

  Future<http.Response> getAllReports({
    String? portfolioId,
    DateTime? after,
    int? limit,
    // TODO make enum
    String? type,
    bool? ignoreExpired,
  }) async {

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

  }

  Future<http.Response> getReport({
    required String? reportId
  }) async {

  }
}