@IBAction func invite(sender: AnyObject) {
    /* See the "Specify Local Media Constraints when Creating a Conversation"
    guide for instructions on constructing LocalMedia */
    outgoingInvite = self.client?.inviteManyToConversation(["alice", "bob"], localMedia:localMedia!,
        { conversation, error in
            if error == nil {
                conversation!.delegate = self
                print("Successfully connected to Conversation: " + conversation!.sid!)
            } else {
                print("Unable to connect to Conversation: " + error!.localizedDescription)
            }
    })
}

// MARK: TWCConversationDelegate
extension ViewController: TWCConversationDelegate {
  func conversation(conversation: TWCConversation,
      didConnectParticipant participant: TWCParticipant) {
  	  print("A remote Participant connected: " + participant.sid!)
  }
}