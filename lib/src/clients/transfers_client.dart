import '../clients/client.dart';
import '../rest_clients/transfers_rest_client.dart';

class TransfersClient extends Client {
  bool sandbox;
  String apiKey;
  String secretKey;
  String passphrase;
  late TransfersRestClient _transfersRestClient;

  TransfersClient({
    this.sandbox = false,
    required this.apiKey,
    required this.secretKey,
    required this.passphrase,
  }) {
    _transfersRestClient = TransfersRestClient(
      sandbox: sandbox,
      apiKey: apiKey,
      secretKey: secretKey,
      passphrase: passphrase,
    );
  }
}
