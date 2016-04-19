extension ViewController: TwilioIPMessagingClientDelegate {
  // Called whenever a channel is added
  func ipMessagingClient(client: TwilioIPMessagingClient!, channelAdded 
      channel: TWMChannel!) {
    if(channel.status == TWMChannelStatus.Invited) {
      channel.joinWithCompletion() { channelResult in
        if channelResult == .Success {
          print("joined channel.")
        }
      }]; 
    }
  }
}