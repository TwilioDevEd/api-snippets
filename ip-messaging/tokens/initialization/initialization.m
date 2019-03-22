#import <TwilioChatClient/TwilioChatClient.h>

// Make a secure request to your backend to retrieve an access token.
// Use an authentication mechanism to prevent token exposure to 3rd parties.

NSString *accessToken = @"<your token here>";

[TwilioChatClient chatClientWithToken:accessToken
  properties:properties delegate:delegate completion:(TCHResult *result, TwilioChatClient *client) {
    if (![result isSuccessful]) {
      // warn the user the initialization didn't succeed
    }
  }];
