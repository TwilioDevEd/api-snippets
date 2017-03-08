self.accessManager = TwilioAccessManager.init(token: token, delegate: self)
self.client = TwilioChatClient.init(token: accessManager.token, properties: properties, delegate: delegate)

if let client = self.client {
    self.accessManager?.registerClient(client, forUpdates: { [weak client = self.client] (token) in
        client?.updateToken(token)
      })
}
