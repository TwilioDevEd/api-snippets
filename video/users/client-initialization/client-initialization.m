// Access token fetched from server
NSString *accessToken = @"access token string";
       
// create an access manager to take care of token expiration events 
self.accessManager = [TwilioAccessManager accessManagerWithToken:accessToken 
                                                        delegate:self];

// Initialize the conversations SDK and connect to Twilio
self.conversationsClient = [TwilioConversationsClient conversationsClientWithAccessManager:self.accessManager
                                                                                  delegate:self];

/*
 The listen method results in a call to one of two delegate methods, depending
 on the success or failure of the connection to Twilio:
    - conversationsClientDidStartListeningForInvites:
    - conversationsClient:didFailToStartListeningWithError:
 */
[self.conversationsClient listen];