import '../clients/client.dart';
import '../models/conversion.dart';
import '../rest_clients/conversions_rest_client.dart';
import 'package:logger/logger.dart';

class ConversionsClient extends Client {
  Logger _logger = Logger();
  bool sandbox;
  String apiKey;
  String secretKey;
  String passphrase;
  late ConversionsRestClient _conversionsRestClient;

  ConversionsClient({
    this.sandbox = false,
    required this.apiKey,
    required this.secretKey,
    required this.passphrase,
  }) {
    _conversionsRestClient = ConversionsRestClient(
      sandbox: sandbox,
      apiKey: apiKey,
      secretKey: secretKey,
      passphrase: passphrase,
    );
  }

  Future<Conversion> convertCurrency({
    String? profileId,
    required String from,
    required String to,
    required double amount,
    String? nonce,
  }) async {
    var response = await _conversionsRestClient.convertCurrency(
      profileId: profileId,
      from: from,
      to: to,
      amount: amount,
      nonce: nonce,
    );

    if (response.statusCode != 200) throw response;

    return Conversion.fromJson(mapDecode(response.body));
  }

  Future<Conversion> getConversion({
    required String conversionId,
  }) async {

    var response = await _conversionsRestClient.getConversion(conversionId: conversionId);

    if (response.statusCode != 200) throw response;

    return Conversion.fromJson(mapDecode(response.body));
  }
}