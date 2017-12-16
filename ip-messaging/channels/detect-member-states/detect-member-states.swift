extension ViewController: TwilioChatClientDelegate {
    func chatClient(client: TwilioChatClient!, channel: TCHChannel!,
                    memberJoined member: TCHMember!) {
        print("Member joined: \(member.identity)")
    }
    
    func chatClient(client: TwilioChatClient!, channel: TCHChannel!,
                    member member: TCHMember!, updated update: TCHMemberUpdate) {
        print("Member changed: \(member.identity)")
    }
    
    func chatClient(client: TwilioChatClient!, channel: TCHChannel!,
                    memberLeft member: TCHMember!) {
        print("Member left: \(member.identity)")
    }
    
    func chatClient(client: TwilioChatClient!,
                    typingStartedOnChannel channel: TCHChannel!,
                                           member: TCHMember!) {
        print("Member started typing: \(member.identity)")
    }
    
    func chatClient(client: TwilioChatClient!,
                    typingEndedOnChannel channel: TCHChannel!,
                                         member: TCHMember!) {
        print("Member ended typing: \(member.identity)")
    }
    

}
