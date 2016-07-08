// Where "client" is an authenticated client obtained with
// TwilioIPMessagingClient.ipMessagingClientWithAccessManager(accessManager:, properties:, delegate:)
// and the callback for ipMessagingClient(client:, synchronizationStatusChanged:) has been called with .ChannelsListCompleted
let channel: TWMChannel? = client?.channelsList()?.channelWithUniqueName("general")
if let channel = channel {
    channel.joinWithCompletion() { channelResult in
        if channelResult.isSuccessful() {
            print("Channel joined.")
        } else {
            print("Channel NOT joined.")
        }
    }
}
