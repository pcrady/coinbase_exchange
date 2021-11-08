import 'dart:convert';

/// A base class for clients which return coinbase_exchange objects
/// basically it just contains helper functions.
abstract class Client {
  /// A helper function to decode lists from coinbase
  List<Map<String, dynamic>> listDecode(String body) =>
      List<Map<String, dynamic>>.from(json.decode(body));

  /// A helper function to decode maps from coinbase
  Map<String, dynamic> mapDecode(String body) =>
      Map<String, dynamic>.from(json.decode(body));
}
