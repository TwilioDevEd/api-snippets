// Create an AccessManager to manage our Access Token
TwilioAccessManager *accessManager = [TwilioAccessManager accessManagerWithToken:accessToken 
                                                        				delegate:self];

// Create a Conversations Client and connect to Twilio's backend. 
TwilioConversationsClient *conversationsClient = 
	[TwilioConversationsClient conversationsClientWithAccessManager:self.accessManager
                                                           delegate:self];
[conversationsClient listen];

/* See the "Working with Conversations" guide for instructions on implementing
a TwilioConversationsClientDelegate */ 

#pragma mark - TwilioConversationsClientDelegate

- (void)conversationsClientDidStartListeningForInvites:(TwilioConversationsClient *)conversationsClient {
    NSLog(@"Connected to Twilio!");
    ...
}