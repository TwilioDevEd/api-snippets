- (void)chatClient:(TwilioChatClient *)client
           channel:(TCHChannel *)channel
      messageAdded:(TCHMessage *)message {
    [self addMessages:@[message]];
}


- (void)chatClient:(TwilioChatClient *)client
           channel:(TCHChannel *)channel
      memberJoined:(TCHMember *)member {
    NSLog(@"Member joined: %@", member.userInfo.identity);
}

- (void)chatClient:(TwilioChatClient *)client
           channel:(TCHChannel *)channel
     memberChanged:(TCHMember *)member {
    NSLog(@"Member changed: %@", member.userInfo.identity);
}

- (void)chatClient:(TwilioChatClient *)client
           channel:(TCHChannel *)channel
        memberLeft:(TCHMember *)member {
    NSLog(@"Member left: %@", member.userInfo.identity);
}

- (void)chatClient:(TwilioChatClient *)client
typingStartedOnChannel:(TCHChannel *)channel
            member:(TCHMember *)member {
    NSLog(@"Member started typing: %@", member.userInfo.identity);
}

- (void)chatClient:(TwilioChatClient *)client
typingEndedOnChannel:(TCHChannel *)channel
            member:(TCHMember *)member {
    NSLog(@"Member ended typing: %@", member.userInfo.identity);
}
