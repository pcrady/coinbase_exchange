import 'package:json_annotation/json_annotation.dart';

part 'preferences.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Preferences {
  final String? preferredMarket;
  final DateTime? marginTermsCompletedInUtc;
  final DateTime? marginTutorialCompletedInUtc;

  Preferences({
    this.preferredMarket,
    this.marginTermsCompletedInUtc,
    this.marginTutorialCompletedInUtc,
  });

  factory Preferences.fromJson(Map<String, dynamic> json) => _$PreferencesFromJson(json);

  Map<String, dynamic> toJson() => _$PreferencesToJson(this);
}