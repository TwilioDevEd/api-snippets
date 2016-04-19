- (void)sendConversationInvite
{
	if (self.client) {
		/* See the "Specify Local Media Constraints when Creating a
		Conversation" guide for instructions on constructing LocalMedia */
		outgoingInvite = [self.client inviteManyToConversation:@[@"alice", @"bob"]
													localMedia:localMedia
													   handler:[self acceptHandler]];
	}
}

- (TWCInviteAcceptanceBlock)acceptHandler
{
	return ^(TWCConversation * _Nullable conversation, NSError * _Nullable error) {
		if (conversation) {
			NSLog(@"Successfully connected to Conversation: %@", conversation.sid)
			conversation.delegate = self;
		}
		else {
			NSLog(@"Unable to connect to Conversation: %@", [error localizedDescription]);
		}
	};
}

#pragma mark - TWCConversationDelegate

- (void)conversation:(TWCConversation *)conversation didConnectParticipant:(TWCParticipant *)participant
{
	NSLog(@"A remote Participant connected: %@", participant.sid);
}