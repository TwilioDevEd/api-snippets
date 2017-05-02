self.accessManager = [TwilioAccessManager accessManagerWithToken:token
                                                        delegate:self];
[TwilioChatClient chatClientWithToken:accessManager.currentToken
                           properties:properties
                             delegate:delegate
                           completion:(TCHResult *result, TwilioChatClient *client) {
  if ([result isSuccessful]) {
    self.client = client;
    __weak typeof(client) weakClient = client;
    [accessManager registerClient:client forUpdates:^(NSString *updatedToken) {
        [weakClient updateToken:updatedToken completion:^(TCHResult *result) {
          if (![result isSuccessful]) {
            // warn the user the update didn't succeed
          }
        }];
    }];
  }
 }];
