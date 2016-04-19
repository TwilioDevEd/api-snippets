let clients: [String] = ["Eggs", "Milk"]

if(self.client != nil) {
    self.outgoingInvite = self.client?.inviteManyToConversation(clients, localMedia: self.localMedia!, handler: self.acceptHandler());
}