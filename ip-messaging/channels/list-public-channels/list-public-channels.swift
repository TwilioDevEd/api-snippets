client.channelsList().publicChannelDescriptorsWithCompletion({ (result, paginator) in
  if (result.isSuccessful()) {
    for channel in paginator.items() {
        print("Channel: \(channel.friendlyName)")
    }
  }
})
