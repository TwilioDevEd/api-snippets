extension ViewController: TwilioChatClientDelegate {
    func chatClient(client: TwilioChatClient!, channel: TCHChannel!,
                    memberJoined member: TCHMember!) {
        print("Member joined: \(member.userInfo.identity)")
    }
    
    func chatClient(client: TwilioChatClient!, channel: TCHChannel!,
                    memberChanged member: TCHMember!) {
        print("Member changed: \(member.userInfo.identity)")
    }
    
    func chatClient(client: TwilioChatClient!, channel: TCHChannel!,
                    memberLeft member: TCHMember!) {
        print("Member left: \(member.userInfo.identity)")
    }
    
    func chatClient(client: TwilioChatClient!,
                    typingStartedOnChannel channel: TCHChannel!,
                                           member: TCHMember!) {
        print("Member started typing: \(member.userInfo.identity)")
    }
    
    func chatClient(client: TwilioChatClient!,
                    typingEndedOnChannel channel: TCHChannel!,
                                         member: TCHMember!) {
        print("Member ended typing: \(member.userInfo.identity)")
    }
    

}
