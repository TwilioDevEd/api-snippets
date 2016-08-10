// To disconnect from a Conversation, we call:
[self.conversation disconnect];


// This results in a call to TWCConversationDelegate#conversationEnded

#pragma mark - TWCConversationDelegate

- (void)conversationEnded:(TWCConversation *)conversation {
	NSLog(@"Disconnected from the Conversation.");
	self.conversation = nil;
}
