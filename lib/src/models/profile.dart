import 'package:json_annotation/json_annotation.dart';

part 'profile.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Profile {
  final String? id;
  final String? userId;
  final String? name;
  final bool? active;
  final bool? isDefault;
  final DateTime? createdAt;
  final bool? hasMargin;

  Profile({
    this.id,
    this.userId,
    this.name,
    this.active,
    this.isDefault,
    this.createdAt,
    this.hasMargin,
  });

  factory Profile.fromJson(Map<String, dynamic> json) => _$ProfileFromJson(json);

  Map<String, dynamic> toJson() => _$ProfileToJson(this);
}