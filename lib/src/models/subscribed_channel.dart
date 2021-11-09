import 'package:json_annotation/json_annotation.dart';

part 'subscribed_channel.g.dart';

/// An object which contains information about an individually subscribed
/// channel.
@JsonSerializable(fieldRename: FieldRename.snake)
class SubscribedChannel {
  final String? name;
  final List<String>? productIds;

  SubscribedChannel({
    this.name,
    this.productIds,
  });

  factory SubscribedChannel.fromJson(Map<String, dynamic> json) =>
      _$SubscribedChannelFromJson(json);

  Map<String, dynamic> toJson() => _$SubscribedChannelToJson(this);
}
