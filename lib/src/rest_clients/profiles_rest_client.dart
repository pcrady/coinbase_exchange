import '../rest_clients/rest_client.dart';
import 'package:http/http.dart' as http;

/// A [RestClient] that helps manage profiles and returns http.Response
/// objects
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

  /// Get profiles
  ///
  /// Gets a list of all of the current user's profiles.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getprofiles
  ///
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

  /// Create a profile
  ///
  /// Create a new profile. Will fail if no name is provided or if user already has 10 profiles.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_postprofile
  ///
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

  /// Transfer funds between profiles
  ///
  /// Transfer an amount of currency from one profile to another.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_postprofiletransfer
  ///
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

  /// Get profile by id
  ///
  /// Information for a single profile. Use this endpoint when you know the profile_id.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getprofile
  ///
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

  /// Rename a profile
  ///
  /// Rename a profile. Names 'default' and 'margin' are reserved.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_putprofile
  ///
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

  /// Delete a profile
  ///
  /// Deletes the profile specified by profile_id and transfers all
  /// funds to the profile specified by to. Fails if there are any
  /// open orders on the profile to be deleted.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_putprofiledeactivate
  ///
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
