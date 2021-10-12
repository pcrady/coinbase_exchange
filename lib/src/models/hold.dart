import '../lib/custom_json_converters.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hold.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake, explicitToJson: true)
class Hold {
  DateTime? createdAt;
  String? id;
  @StringToDoubleConverter()
  double? amount;
  //TODO make this an enum
  String? type;
  String? ref;

  Hold({
    this.createdAt,
    this.id,
    this.amount,
    this.type,
    this.ref,
  });

  factory Hold.fromJson(Map<String, dynamic> json) => _$HoldFromJson(json);

  Map<String, dynamic> toJson() => _$HoldToJson(this);
}
