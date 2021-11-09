import 'package:coinbase_exchange/coinbase_exchange.dart';
import 'package:json_annotation/json_annotation.dart';

part 'preferences.g.dart';

/// The preferences of a [User].
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

  factory Preferences.fromJson(Map<String, dynamic> json) =>
      _$PreferencesFromJson(json);

  Map<String, dynamic> toJson() => _$PreferencesToJson(this);
}
