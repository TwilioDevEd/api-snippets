// To disconnect from a Conversation, we call:
self.conversation?.disconnect()


// This results in a call to TWCConversationDelegate#conversationEnded

// MARK: TWCConversationDelegate  
func conversationEnded(conversation: TWCConversation) {
	print(@"Disconnected from the Conversation.")
    self.conversation = nil
}