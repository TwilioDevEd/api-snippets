self.client?.channelsListWithCompletion { result, channels in
  if (result == .Success) {
    // Get a list of all channels available to a user
    for channel in channels.allObjects() {
      print(channel.friendlyName)
    }

    // Get a specific channel by unique friendlyName
    if let channel = channels.channelWithUniqueName("general") {
      print(channel.friendlyName)
    }
  }
}