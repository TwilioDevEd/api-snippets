- (void)chatClientTokenWillExpire:(TwilioChatClient *)chatClient {
    // Make a secure request to your backend to retrieve a refreshed access token.
    // Use an authentication mechanism to prevent token exposure to 3rd parties.
    NSString *accessToken = fetchToken();

    [chatClient updateToken:accessToken
        completion:^(TCHResult * _Nonnull result) {
            if (!result.isSuccessful) {
                NSLog(@"Error updating token: %@", result.error);
            }
        }];
}
