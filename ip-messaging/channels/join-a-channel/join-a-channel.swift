// Where "client" is an authenticated client obtained with 
// TwilioIPMessagingClient.ipMessagingClientWithToken(token, delegate: someObj);
client?.channelsListWithCompletion { result, channels in
  if (result == .Success) {
    if let channel = channels.channelWithUniqueName("general") {
      channel.joinWithCompletion() { channelResult in
        if channelResult == .Success {
          print("joined channel.")
        }
      }
    }
  }
}
