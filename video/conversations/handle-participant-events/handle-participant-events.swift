// MARK: TWCConversationDelegate

func conversation(conversation: TWCConversation, 
		didConnectParticipant participant: TWCParticipant) {
    print("Participant connected: " + participant.identity)
}

func conversation(conversation: TWCConversation, 
		didFailToConnectParticipant participant: TWCParticipant, error: NSError) {
    print("Participant failed to connect: " + participant.identity)
    print("With error: " + error.localizedDescription)
}

func conversation(conversation: TWCConversation, 
		didDisconnectParticipant participant: TWCParticipant) {
    print("Participant disconnected: " + participant.identity)
}
