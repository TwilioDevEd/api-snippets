// To disconnect from a Conversation, we call:
conversation.disconnect();


// This results in a call to ConversationListener#onConversationEnded
private Conversation.Listener conversationListener() {
  return new Conversation.Listener() {

    ...

    @Override
    public void onConversationEnded(Conversation conversation,
                                    TwilioConversationsException e) {
      // Dispose of the Conversation after disconnecting
      conversation = null;
    }
  };
}
