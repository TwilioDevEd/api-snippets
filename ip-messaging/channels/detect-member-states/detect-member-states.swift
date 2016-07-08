extension ViewController: TwilioIPMessagingClientDelegate {
    func ipMessagingClient(client: TwilioIPMessagingClient!, channel: TWMChannel!,
                           memberJoined member: TWMMember!) {
        print("Member joined: \(member.userInfo.identity)")
    }

    func ipMessagingClient(client: TwilioIPMessagingClient!, channel: TWMChannel!,
                           memberChanged member: TWMMember!) {
        print("Member changed: \(member.userInfo.identity)")
    }
    
    func ipMessagingClient(client: TwilioIPMessagingClient!, channel: TWMChannel!,
                           memberLeft member: TWMMember!) {
        print("Member left: \(member.userInfo.identity)")
    }

    func ipMessagingClient(client: TwilioIPMessagingClient!,
                           typingStartedOnChannel channel: TWMChannel!, member: TWMMember!) {
        print("Member started typing: \(member.userInfo.identity)")
    }
    
    func ipMessagingClient(client: TwilioIPMessagingClient!,
                           typingEndedOnChannel channel: TWMChannel!, member: TWMMember!) {
        print("Member ended typing: \(member.userInfo.identity)")
    }

}
