- (void)chatClient:(TwilioChatClient *)client
           channel:(TCHChannel *)channel
      messageAdded:(TCHMessage *)message {
    [self addMessages:@[message]];
}


- (void)chatClient:(TwilioChatClient *)client
           channel:(TCHChannel *)channel
      memberJoined:(TCHMember *)member {
    NSLog(@"Member joined: %@", member.identity);
}

- (void)chatClient:(TwilioChatClient *)client
           channel:(TCHChannel *)channel
            member:(TCHMember *)member 
           updated:(TCHMemberUpdate)update {
    NSLog(@"Member changed: %@", member.identity);
}

- (void)chatClient:(TwilioChatClient *)client
           channel:(TCHChannel *)channel
        memberLeft:(TCHMember *)member {
    NSLog(@"Member left: %@", member.identity);
}

- (void)chatClient:(TwilioChatClient *)client
typingStartedOnChannel:(TCHChannel *)channel
            member:(TCHMember *)member {
    NSLog(@"Member started typing: %@", member.identity);
}

- (void)chatClient:(TwilioChatClient *)client
typingEndedOnChannel:(TCHChannel *)channel
            member:(TCHMember *)member {
    NSLog(@"Member ended typing: %@", member.identity);
}
