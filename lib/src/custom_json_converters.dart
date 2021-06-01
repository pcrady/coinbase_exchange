import 'package:json_annotation/json_annotation.dart';

class StringToDoubleConverter implements JsonConverter<double?, String?> {
  const StringToDoubleConverter();

  @override
  double? fromJson(String? json) => json == null ? null : double.parse(json);

  @override
  String? toJson(double? object) => object.toString();
}