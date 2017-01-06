// Where "client" is an authenticated client obtained with
// TwilioChatClient(token:, properties:, delegate:)
// and the callback for chatClient(client:, synchronizationStatusChanged:) has been called with .completed
let channel = client.channelsList().channel(withSidOrUniqueName:"general")
if let channel = channel {
    channel.join(completion: { channelResult in
        if channelResult.isSuccessful() {
            print("Channel joined.")
        } else {
            print("Channel NOT joined.")
        }
    }
}
