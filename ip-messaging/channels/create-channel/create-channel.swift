client?.channelsListWithCompletion { result, channels in
  if (result == .Success) {
    // Create the general channel (for public use) if it hasn't been created yet
    channels.createChannelWithFriendlyName("General Channel",
        type: .Public) { channelResult, channel in
      if channelResult == .Success {
        print("Channel created")
      }
    }
  }
}