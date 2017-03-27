client.channelsList().publicChannelsWithCompletion({ (result, paginator) in
  if (result.isSuccessful()) {
    for channel in paginator.items() {
        print("Channel: \(channel.friendlyName)")
    }
  }
})
