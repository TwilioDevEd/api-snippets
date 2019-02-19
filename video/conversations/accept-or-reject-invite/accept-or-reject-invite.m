/* Create an AccessManager - this provides a single place to update your Twilio
Access Token when using multiple Twilio SDKs */ 
TwilioAccessManager *accessManager = 
	[TwilioAccessManager accessManagerWithToken:accessToken delegate:self];

// Create a Conversations Client and listen for IncomingInvites
TwilioConversationsClient *conversationsClient = 
	[TwilioConversationsClient conversationsClientWithAccessManager:accessManager delegate:self];
[conversationsClient listen];


#pragma mark - TwilioConversationsClientDelegate

- (void)conversationsClient:(TwilioConversationsClient *)conversationsClient 
		didReceiveInvite:(TWCIncomingInvite *)invite {
	// Selectively handle IncomingInvites based on the originator
	if([invite.from isEqual:@"ringo"]) {
		[invite reject];
	} else {
		/* See the "Specify Local Media Constraints when Creating a
		Conversation" guide for instructions on constructing LocalMedia */
		[invite acceptWithLocalMedia:self.localMedia
						  completion:[self acceptHandler]];    
	}
}