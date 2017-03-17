extension ViewController: TwilioChatClientDelegate {
    func chatClient(client: TwilioChatClient!, channelAdded channel: TCHChannel!) {
        print("Channel added: \(channel.friendlyName)")
    }
    
    func chatClient(client: TwilioChatClient!, channelChanged channel: TCHChannel!) {
        print("Channel changed: \(channel.friendlyName)")
    }
    
    func chatClient(client: TwilioChatClient!, channelDeleted channel: TCHChannel!) {
        print("Channel deleted: \(channel.friendlyName)")
    }
}
