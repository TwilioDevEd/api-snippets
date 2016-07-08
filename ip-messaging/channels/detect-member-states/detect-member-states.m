- (void)ipMessagingClient:(TwilioIPMessagingClient *)client
                  channel:(TWMChannel *)channel
             memberJoined:(TWMMember *)member {
    NSLog(@"Member joined: %@", member.userInfo.identity);
}

- (void)ipMessagingClient:(TwilioIPMessagingClient *)client
                  channel:(TWMChannel *)channel
            memberChanged:(TWMMember *)member {
    NSLog(@"Member changed: %@", member.userInfo.identity);
}

- (void)ipMessagingClient:(TwilioIPMessagingClient *)client
                  channel:(TWMChannel *)channel
               memberLeft:(TWMMember *)member {
    NSLog(@"Member left: %@", member.userInfo.identity);
}

- (void)ipMessagingClient:(TwilioIPMessagingClient *)client
   typingStartedOnChannel:(TWMChannel *)channel
                   member:(TWMMember *)member {
    NSLog(@"Member started typing: %@", member.userInfo.identity);
}

- (void)ipMessagingClient:(TwilioIPMessagingClient *)client
     typingEndedOnChannel:(TWMChannel *)channel
                   member:(TWMMember *)member {
    NSLog(@"Member ended typing: %@", member.userInfo.identity);
}
