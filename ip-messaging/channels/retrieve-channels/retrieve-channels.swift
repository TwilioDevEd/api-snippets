let channels: TWMChannels? = client?.channelsList()
if let channels = channels {
    for channel in channels.allObjects() {
        print("Channel: \(channel.friendlyName)")
    }
    
    // Get a specific channel by unique name
    if let channel = channels.channelWithUniqueName("general") {
        print("Channel with unique name: \(channel.friendlyName)")
    }
}
