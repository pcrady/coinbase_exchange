import 'dart:convert';

class Client {
  List<Map<String, dynamic>> listDecode(String body) => List<Map<String, dynamic>>.from(json.decode(body));

  Map<String, dynamic> mapDecode(String body) => Map<String, dynamic>.from(json.decode(body));
}