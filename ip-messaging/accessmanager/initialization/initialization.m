self.accessManager = [TwilioAccessManager accessManagerWithToken:token
                                                        delegate:self];
self.client = [TwilioChatClient chatClientWithToken:accessManager.currentToken
                                         properties:properties
                                           delegate:delegate];
__weak typeof(client) weakClient = client;
[accessManager registerClient:client forUpdates:^(NSString *updatedToken) {
    [weakClient updateToken:updatedToken];
}];
