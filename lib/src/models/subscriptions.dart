import 'package:coinbase_dart/src/models/subscribed_channel.dart';

///
/// Once a subscribe message is received the server will respond with a subscriptions
/// message that lists all channels you are subscribed to. Subsequent subscribe messages
/// will add to the list of subscriptions.In case you already subscribed to a channel
/// without being authenticated you will remain in the unauthenticated channel.
///
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