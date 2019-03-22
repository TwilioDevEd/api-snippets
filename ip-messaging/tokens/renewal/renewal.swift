func chatClientTokenWillExpire(_ chatClient: TwilioChatClient) {
  // Implement fetchToken() to make a secure request to your backend to retrieve a refreshed access token.
  // Use an authentication mechanism to prevent token exposure to 3rd parties.
  fetchToken(completion: { (updatedToken) -> (Void) in
    if let updatedToken = updatedToken {
      chatClient.updateToken(updatedToken, completion: { (result) in
        if !result.isSuccessful() {
          print("Error updating token: \(String(describing: result.error?.description))")
            return
          }
      })
    }
  })
}
