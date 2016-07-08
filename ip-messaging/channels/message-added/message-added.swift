extension ViewController: TwilioIPMessagingClientDelegate {
    // Called whenever a channel we've joined receives a new message
    func ipMessagingClient(client: TwilioIPMessagingClient!, channel: TWMChannel!,
                           messageAdded message: TWMMessage!) {
        print("\(message.author) said: \(message.body)")
    }
}
