// Create an AccessManager to manage our Access Token
var accessManager = TwilioAccessManager(token:accessToken, delegate:self);

// Create a Conversations Client and connect to Twilio's backend.
var client = TwilioConversationsClient(accessManager: accessManager!,
									   delegate: self);
client!.listen()

/* See the "Working with Conversations" guide for instructions on implementing
a TwilioConversationsClientDelegate */ 

// MARK: TwilioConversationsClientDelegate

func conversationsClientDidStartListeningForInvites(conversationsClient: TwilioConversationsClient) {
    print("Connected to Twilio!")
    ...
}