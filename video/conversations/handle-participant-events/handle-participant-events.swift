func conversation(conversation: TWCConversation, didConnectParticipant participant: TWCParticipant) {
    NSLog("Participant connected: %@", participant.identity);
}
func conversation(conversation: TWCConversation, didDisconnectParticipant participant: TWCParticipant) {
    NSLog("Participant disconnected");
}
func conversation(conversation: TWCConversation, didFailToConnectParticipant participant: TWCParticipant, error: NSError) {
    NSLog("Participant failed to connect");
}