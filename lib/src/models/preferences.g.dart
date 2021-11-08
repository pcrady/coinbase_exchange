// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Preferences _$PreferencesFromJson(Map<String, dynamic> json) => Preferences(
      preferredMarket: json['preferred_market'] as String?,
      marginTermsCompletedInUtc: json['margin_terms_completed_in_utc'] == null
          ? null
          : DateTime.parse(json['margin_terms_completed_in_utc'] as String),
      marginTutorialCompletedInUtc: json['margin_tutorial_completed_in_utc'] ==
              null
          ? null
          : DateTime.parse(json['margin_tutorial_completed_in_utc'] as String),
    );

Map<String, dynamic> _$PreferencesToJson(Preferences instance) =>
    <String, dynamic>{
      'preferred_market': instance.preferredMarket,
      'margin_terms_completed_in_utc':
          instance.marginTermsCompletedInUtc?.toIso8601String(),
      'margin_tutorial_completed_in_utc':
          instance.marginTutorialCompletedInUtc?.toIso8601String(),
    };
