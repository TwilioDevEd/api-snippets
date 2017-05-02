let channels = client.channelsList().subscribedChannels()
for channel in channels {
    print("Channel: \(channel.friendlyName)")
}
