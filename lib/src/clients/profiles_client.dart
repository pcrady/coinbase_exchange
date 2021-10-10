import 'package:coinbase_dart/src/clients/client.dart';
import 'package:coinbase_dart/src/models/profile.dart';
import 'package:coinbase_dart/src/rest_clients/profiles_rest_client.dart';
import 'package:logger/logger.dart';
import 'dart:convert';

class ProfilesClient extends Client {
  Logger _logger = Logger();
  bool sandbox;
  String apiKey;
  String secretKey;
  String passphrase;
  late ProfilesRestClient _profilesRestClient;

  ProfilesClient({
    this.sandbox = false,
    required this.apiKey,
    required this.secretKey,
    required this.passphrase,
  }) {
    _profilesRestClient = ProfilesRestClient(
      sandbox: sandbox,
      apiKey: apiKey,
      secretKey: secretKey,
      passphrase: passphrase,
    );
  }

  /// Get profiles
  ///
  /// Gets a list of all of the current user's profiles.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getprofiles
  ///
  Future<List<Profile>> getProfiles({
    bool? active,
  }) async {
    var response = await _profilesRestClient.getProfiles(active: active);

    if (response.statusCode != 200) throw response;

    return listDecode(response.body).map((product) => Profile.fromJson(product)).toList();
  }

  /// Create a profile
  ///
  /// Create a new profile. Will fail if no name is provided or if user already has 10 profiles.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_postprofile
  ///
  Future<Profile> createProfile({
    String? name,
  }) async {
    var response = await _profilesRestClient.createProfile(name: name);

    if (response.statusCode != 200) throw response;

    return Profile.fromJson(json.decode(response.body));
  }

  /// Transfer funds between profiles
  ///
  /// Transfer an amount of currency from one profile to another.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_postprofiletransfer
  ///
  Future<Map> transferFundsBetweenProfiles({
    required String from,
    required String to,
    required String currency,
    required double amount,
  }) async {
    var response = await _profilesRestClient.transferFundsBetweenProfiles(
      from: from,
      to: to,
      currency: currency,
      amount: amount,
    );

    if (response.statusCode != 200) throw response;

    return json.decode(response.body);
  }

  /// Get profile by id
  ///
  /// Information for a single profile. Use this endpoint when you know the profile_id.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_getprofile
  ///
  Future<Profile> getProfileById({
    required String profileId,
    bool? active,
  }) async {
    var response = await _profilesRestClient.getProfileById(profileId: profileId);

    if (response.statusCode != 200) throw response;

    return Profile.fromJson(json.decode(response.body));
  }

  /// Rename a profile
  ///
  /// Rename a profile. Names 'default' and 'margin' are reserved.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_putprofile
  ///
  Future<Profile> renameProfile({
    required String profileId,
    required String name,
  }) async {
    var response = await _profilesRestClient.renameProfile(
      profileId: profileId,
      name: name,
    );

    if (response.statusCode != 200) throw response;

    return Profile.fromJson(json.decode(response.body));
  }

  /// Delete a profile
  ///
  /// Deletes the profile specified by profile_id and transfers all
  /// funds to the profile specified by to. Fails if there are any
  /// open orders on the profile to be deleted.
  ///
  /// https://docs.cloud.coinbase.com/exchange/reference/exchangerestapi_putprofiledeactivate
  ///
  Future<Map> deleteProfile({
    required String profileId,
    required String to,
  }) async {
    var response = await _profilesRestClient.deleteProfile(
      profileId: profileId,
      to: to,
    );

    if (response.statusCode != 200) throw response;

    return json.decode(response.body);
  }
}