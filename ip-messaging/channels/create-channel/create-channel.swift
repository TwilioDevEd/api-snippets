// Create the general channel (for public use) if it hasn't been created yet
let channels: TWMChannels? = client?.channelsList()
let options: [NSObject:AnyObject] = [
    TWMChannelOptionFriendlyName: "General Channel",
    TWMChannelOptionUniqueName: "general",
    TWMChannelOptionType: TWMChannelType.Public.rawValue
]
channels?.createChannelWithOptions(options) { channelResult, channel in
    if channelResult.isSuccessful() {
        print("Channel created.")
    } else {
        print("Channel NOT created.")
    }
}
