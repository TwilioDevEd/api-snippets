let invitees: [String] = ["Charles", "Dena"]

// See the "Create a Conversation" guide for instructions on configuring a TWCConversationsDelegate
do {
    try conversation.inviteMany(invitees)
} catch {
    print("Unable to send the Invites")
}
/* Results in total of two callbacks to either of
TWCConversationDelegate#conversation:didConnectParticipant or
TWCConversationDelegate#conversation:didFailToConnectParticipant */
