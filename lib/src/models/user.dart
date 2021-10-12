import '../models/preferences.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class User {
  final String? createdAt;
  final String? activeAt;
  final String? id;
  final String? name;
  final String? email;
  final dynamic roles;
  final bool? isBanned;
  final String? permissions;
  final String? userType;
  final bool? fulfillsNewRequirements;
  final dynamic flags;
  final dynamic details;
  final String? oathClient;
  final Preferences? preferences;
  final bool? hasDefault;

  User({
    this.createdAt,
    this.activeAt,
    this.id,
    this.name,
    this.email,
    this.roles,
    this.isBanned,
    this.permissions,
    this.userType,
    this.fulfillsNewRequirements,
    this.flags,
    this.details,
    this.oathClient,
    this.preferences,
    this.hasDefault,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  Map<String, dynamic> toJson() => _$UserToJson(this);
}