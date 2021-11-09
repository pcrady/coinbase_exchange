import '../rest_clients/rest_client.dart';
import 'package:http/http.dart' as http;

/// A [RestClient] that helps manage fees and returns [http.Response] objects.
class FeesRestClient extends RestClient {
  FeesRestClient({
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

  Future<http.Response> getFees() async => get(path: '/fees');
}
