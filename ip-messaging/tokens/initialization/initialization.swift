import TwilioChatClient

// Make a secure request to your backend to retrieve an access token.
// Use an authentication mechanism to prevent token exposure to 3rd parties.

let accessToken = "<your token here>"

TwilioChatClient.chatClient(withToken: accessToken,
  properties: nil, delegate: self) {
    (result, chatClient) in
    if (!result.isSuccessful()) {
      // warn the user the initialization didn't succeed
    }
  }
