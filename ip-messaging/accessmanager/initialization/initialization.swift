self.accessManager = TwilioAccessManager.init(token: token, delegate: self)
TwilioChatClient.init(token: accessManager.token, properties: properties, delegate: delegate) { (result, client) in
  if (result.isSuccessful()) {
    self.client = client
    self.accessManager?.registerClient(client, forUpdates: { [weak client = self.client] (token) in
        client?.updateToken(token) { (result) in
          if (!result.isSuccessful()) {
            // warn the user the update didn't succeed
          }
        }
      })
  }
}

