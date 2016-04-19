NSError *error = nil;

// See the "Create a Conversation" guide for instructions on configuring a TWCConversationsDelegate
BOOL didInvite = [self.conversation invite:@"charles" error:&error];
if(didInvite) {
	NSLog(@"Invite sent!");
} else {
	NSLog(@"Unable to send the Invite");
}
/* Results in a callback to
TWCConversationDelegate#conversation:didConnectParticipant or
TWCConversationDelegate#conversation:didFailToConnectParticipant */
