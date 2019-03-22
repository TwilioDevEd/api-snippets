- (void)chatClientTokenWillExpire:(TwilioChatClient *)chatClient {
  // Implement fetchToken() to make a secure request to your backend to retrieve a refreshed access token.
  // Use an authentication mechanism to prevent token exposure to 3rd parties.
  [self fetchToken:completion:^(NSString *updatedToken) {
    [chatClient updateToken:updatedToken
      completion:^(TCHResult * _Nonnull result) {
        if (!result.isSuccessful) {
          NSLog(@"Error updating token: %@", result.error);
        }
      }];
  }]
}
