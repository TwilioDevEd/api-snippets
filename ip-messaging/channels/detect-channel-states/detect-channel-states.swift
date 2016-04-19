extension ViewController: TwilioIPMessagingClientDelegate {
  func ipMessagingClient(client: TwilioIPMessagingClient!,
      channelAdded channel: TMChannel!) {
    print("Channel added: \(channel.friendlyName)")
  }
  
  func ipMessagingClient(client: TwilioIPMessagingClient!,
      channelChanged channel: TMChannel!) {
    print("Channel changed: \(channel.friendlyName)")
  }
  
  func ipMessagingClient(client: TwilioIPMessagingClient!,
      channelDeleted channel: TMChannel!) {
    print("Channel deleted: \(channel.friendlyName)")
  }
  
  func ipMessagingClient(client: TwilioIPMessagingClient!,
      channelHistoryLoaded channel: TMChannel!) {
    print("Channel history loaded: \(channel.friendlyName)")
  }
}