func chatClientTokenWillExpire(_ chatClient: TwilioChatClient) {
    // Make a secure request to your backend to retrieve a refreshed access token.
    // Use an authentication mechanism to prevent token exposure to 3rd parties.
    let accessToken = fetchToken()

    chatClient.updateToken(accessToken, completion: { (result) in
        if !result.isSuccessful() {
            print("Error updating token: \(String(describing: result.error?.description))")
            return
        }
    })
}
