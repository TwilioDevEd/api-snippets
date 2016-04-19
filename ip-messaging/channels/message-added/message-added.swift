extension ViewController: TwilioIPMessagingClientDelegate {
  // Called whenever a channel we've joined receives a new message
  func ipMessagingClient(client: TwilioIPMessagingClient!, channel: TMChannel!,
      messageAdded message: TMMessage!) {
    print("\(message.author) said: \(message.body)")
  }
}