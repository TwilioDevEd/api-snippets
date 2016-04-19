// Access token fetched from server
let accessToken = "token string from server";

// create an access manager to take care of token expiration events 
self.accessManager = TwilioAccessManager(token:accessToken, delegate:self);

self.client = TwilioConversationsClient(accessManager: self.accessManager!, 
  delegate: self);

// Start listening for invitations - delegate methods are fired when the
// connection succeeds or fails
self.client?.listen();
print("The client identity is \(self.client?.identity)");
