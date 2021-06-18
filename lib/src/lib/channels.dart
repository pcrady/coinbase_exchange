import 'package:coinbase_dart/src/lib/subscribed_channel.dart';

class Channels {
  List<SubscribedChannel>? channels;

  Channels({this.channels});

  factory Channels.fromJson(Map<String, dynamic> json) {
    List<SubscribedChannel> subscribedChannels = [];
    json['channels'].forEach((channel) => subscribedChannels.add(SubscribedChannel.fromJson(channel)));
    return Channels(
      channels: subscribedChannels,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'channels': channels?.map((e) => e.toJson()).toList(),
    };
  }
}