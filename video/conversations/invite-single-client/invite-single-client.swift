if(self.client != nil) {
    self.outgoingInvite = self.client?.inviteToConversation(self.inviteeIdentity!, localMedia: self.localMedia!, handler: self.acceptHandler());
}