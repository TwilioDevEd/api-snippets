// Disconnect the conversation based on user input
@IBAction func hangupButtonPressed(sender: AnyObject) {
    self.conversation?.disconnect();
    NSLog("hangup");
}

// Delegate method will be called when a conversation disconnects
func conversationEnded(conversation: TWCConversation) {
    NSLog("Conversation ended");
}