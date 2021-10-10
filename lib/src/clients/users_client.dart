import 'dart:html';

import 'package:coinbase_dart/coinbase_dart.dart';
import 'package:coinbase_dart/src/clients/client.dart';
import 'package:coinbase_dart/src/lib/paginator.dart';
import 'package:coinbase_dart/src/rest_clients/products_rest_client.dart';
import 'package:coinbase_dart/src/rest_clients/profiles_rest_client.dart';
import 'package:coinbase_dart/src/rest_clients/reports_rest_client.dart';
import 'package:coinbase_dart/src/rest_clients/transfers_rest_client.dart';
import 'package:coinbase_dart/src/rest_clients/users_rest_client.dart';
import 'package:logger/logger.dart';
import 'dart:convert';

class UsersClient extends Client {
  Logger _logger = Logger();
  bool sandbox;
  String apiKey;
  String secretKey;
  String passphrase;
  late UsersRestClient _usersRestClient;

  UsersClient({
    this.sandbox = false,
    required this.apiKey,
    required this.secretKey,
    required this.passphrase,
  }) {
    _usersRestClient = UsersRestClient(
      sandbox: sandbox,
      apiKey: apiKey,
      secretKey: secretKey,
      passphrase: passphrase,
    );
  }

}