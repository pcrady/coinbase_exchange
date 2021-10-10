import 'package:coinbase_dart/src/rest_clients/rest_client.dart';
import 'package:logger/logger.dart';
import 'package:http/http.dart' as http;

class ProfilesRestClient extends RestClient {
  ProfilesRestClient({
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

  Future<http.Response> getProfiles({
    bool? active,
  }) async {
    Map<String, dynamic> queryParameters = {};
    if (active != null) queryParameters['active'] = active;

    return get(
      path: '/profiles',
      queryParameters: queryParameters,
    );
  }

  Future<http.Response> createProfile({
    String? name,
  }) async {
    Map<String, dynamic> body = {};
    if (name != null) body['name'] = name;

    return post(
      path: '/profiles',
      body: body,
    );
  }

  Future<http.Response> transferFundsBetweenProfiles({
    required String from,
    required String to,
    required String currency,
    required double amount,
  }) async {
    Map<String, dynamic> body = {
      'from': from,
      'to': to,
      'currency': currency,
      'amount': amount,
    };

    return post(
      path: '/profiles/transfer',
      body: body,
    );
  }

  Future<http.Response> getProfileById({
    required String profileId,
    bool? active,
  }) async {
    Map<String, dynamic> queryParameters = {};
    if (active != null) queryParameters['active'] = active;

    return get(
      path: '/profiles/$profileId',
      queryParameters: queryParameters,
    );
  }

  Future<http.Response> renameProfile({
    required String profileId,
    required String name,
  }) async {
    Map<String, dynamic> body = {
      'profile_id': profileId,
      'name': name,
    };

    return put(
      path: '/profiles/$profileId',
      body: body,
    );
  }

  Future<http.Response> deleteProfile({
    required String profileId,
    required String to,
  }) async {
    Map<String, dynamic> body = {
      'profile_id': profileId,
      'to': to,
    };

    return put(
      path: '/profiles/$profileId',
      body: body,
    );
  }
}