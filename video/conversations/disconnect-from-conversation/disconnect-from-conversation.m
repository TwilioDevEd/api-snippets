// disconnect the conversation based on user input
- (IBAction)discconectConversation:(id)sender {
    [self.conversation disconnect];
}

// Delegate method will be called when a conversation disconnects
- (void)conversationEnded:(TWCConversation *)conversation {
    NSLog(@"Conversation ended.");
}