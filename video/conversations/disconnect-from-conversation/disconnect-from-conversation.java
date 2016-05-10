// To disconnect from a Conversation, we call:
conversation.disconnect();


// This results in a call to ConversationListener#onConversationEnded
private ConversationListener conversationListener() {
  return new ConversationListener() {

    ...

    @Override
    public void onConversationEnded(Conversation conversation,
                                    TwilioConversationsException e) {
      // Dispose of the Conversation after disconnecting
      conversation = null;
    }
  };
}