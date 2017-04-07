let options = [
    TCHChannelOptionFriendlyName: "General Channel",
    TCHChannelOptionType: TCHChannelType.public.rawValue
] as [String : Any]
client?.channelsList().createChannel(options: options, completion: { channelResult, channel in
    if (channelResult?.isSuccessful())! {
        print("Channel created.")
    } else {
        print("Channel NOT created.")
    }
})