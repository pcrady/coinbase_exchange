import '../models/params.dart';
import 'package:json_annotation/json_annotation.dart';

part 'report.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class Report {
  final DateTime? createdAt;
  final DateTime? completedAt;
  final DateTime? expiresAt;
  final String? id;
  final String? type;
  final String? status;
  final String? userId;
  final String? fileUrl;
  final Params? params;
  final int? fileCount;

  Report({
    this.createdAt,
    this.completedAt,
    this.expiresAt,
    this.id,
    this.type,
    this.status,
    this.userId,
    this.fileUrl,
    this.params,
    this.fileCount,
  });

  factory Report.fromJson(Map<String, dynamic> json) => _$ReportFromJson(json);

  Map<String, dynamic> toJson() => _$ReportToJson(this);
}
