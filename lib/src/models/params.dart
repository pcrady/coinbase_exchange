import 'package:coinbase_exchange/coinbase_exchange.dart';

import '../models/user.dart';
import 'package:json_annotation/json_annotation.dart';

part 'params.g.dart';

/// The parameters of a [Report] object.
@JsonSerializable(fieldRename: FieldRename.snake)
class Params {
  final DateTime? startDate;
  final DateTime? endDate;
  final String? format;
  final String? productId;
  final String? accountId;
  final String? profileId;
  final String? email;
  final User? user;
  final bool? newYorkState;

  Params({
    this.startDate,
    this.endDate,
    this.format,
    this.productId,
    this.accountId,
    this.profileId,
    this.email,
    this.user,
    this.newYorkState,
  });

  factory Params.fromJson(Map<String, dynamic> json) => _$ParamsFromJson(json);

  Map<String, dynamic> toJson() => _$ParamsToJson(this);
}
