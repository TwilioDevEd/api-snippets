extension ViewController: TwilioIPMessagingClientDelegate {
    func ipMessagingClient(client: TwilioIPMessagingClient!,
                           channelAdded channel: TWMChannel!) {
        print("Channel added: \(channel.friendlyName)")
    }
    
    func ipMessagingClient(client: TwilioIPMessagingClient!,
                           channelChanged channel: TWMChannel!) {
        print("Channel changed: \(channel.friendlyName)")
    }
    
    func ipMessagingClient(client: TwilioIPMessagingClient!,
                           channelDeleted channel: TWMChannel!) {
        print("Channel deleted: \(channel.friendlyName)")
    }
    
    func ipMessagingClient(client: TwilioIPMessagingClient!,
                           channelHistoryLoaded channel: TWMChannel!) {
        print("Channel history loaded: \(channel.friendlyName)")
    }
}
