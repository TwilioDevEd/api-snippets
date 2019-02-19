extension ViewController: TwilioChatClientDelegate {
  // Called whenever a channel is added
  func chatClient(client: TwilioChatClient!, channelAdded channel: TCHChannel!) {
    if(channel.status == TCHChannelStatus.Invited) {
      channel.joinWithCompletion() { channelResult in
        if channelResult.isSuccessful() {
            print("Successfully accepted invite.");
        } else {
            print("Failed to accept invite.");
        }
      }
    }
  }
}
