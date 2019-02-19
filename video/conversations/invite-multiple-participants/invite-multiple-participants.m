NSError *error = nil;

// See the "Create a Conversation" guide for instructions on configuring a TWCConversationsDelegate
BOOL didInvite = [self.conversation inviteMany:@[@"charles", @"dena"] error:&error];
if(didInvite) {
	NSLog(@"Invites sent!");
} else {
	NSLog(@"Unable to send the Invites");
}
/* Results in a total of two callbacks to either of
TWCConversationDelegate#conversation:didConnectParticipant or
TWCConversationDelegate#conversation:didFailToConnectParticipant */
