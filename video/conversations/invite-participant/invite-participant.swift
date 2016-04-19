// See the "Create a Conversation" guide for instructions on configuring a TWCConversationsDelegate
do {
    try conversation.invite("charles")
} catch {
    print("Unable to send the Invite")
}
/* Results in a callback to
TWCConversationDelegate#conversation:didConnectParticipant or
TWCConversationDelegate#conversation:didFailToConnectParticipant */
