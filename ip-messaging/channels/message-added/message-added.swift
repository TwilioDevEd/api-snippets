extension ViewController: TwilioChatClientDelegate {
    // Called whenever a channel we've joined receives a new message
    func chatClient(client: TwilioChatClient!, channel: TCHChannel!,
                    messageAdded message: TCHMessage!) {
        print("\(message.author) said: \(message.body)")
    }
}
