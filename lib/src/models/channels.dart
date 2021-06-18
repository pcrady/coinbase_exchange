import 'package:coinbase_dart/src/models/subscribed_channel.dart';

class Subscriptions {
  final List<SubscribedChannel>? channels;

  Subscriptions({this.channels});

  factory Subscriptions.fromJson(Map<String, dynamic> json) {
    List<SubscribedChannel> subscribedChannels = [];
    json['channels'].forEach((channel) => subscribedChannels.add(SubscribedChannel.fromJson(channel)));
    return Subscriptions(
      channels: subscribedChannels,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'channels': channels?.map((e) => e.toJson()).toList(),
    };
  }
}