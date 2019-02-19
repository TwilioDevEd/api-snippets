Set<String> participants = new HashSet<>();
participants.add("alice");
participants.add("bob");

public void onClick(DialogInterface dialog, int which) {
  /* See the "Specify Local Media Constraints when Creating a Conversation"
  guide for instructions on constructing LocalMedia */
  outgoingInvite = conversationsClient.inviteToConversation(participants,
                                localMedia,
                                new ConversationCallback() {
    @Override
    public void onConversation(Conversation conversation, ConversationException e) {
      if (e == null) {
        Log.v(TAG, "Successfully connected to Conversation: " + conversation
          .getConversationSid());
        conversation.setConversationListener(conversationListener());
      } else {
        Log.e(TAG, "Unable to connect to Conversation: " + e.getMessage());
      }
    }
  });
}

private Conversation.Listener conversationListener() {
  return new Conversation.Listener() {
    @Override
    public void onParticipantConnected(Conversation conversation,
                                       Participant participant) {
      Log.v(TAG, "A remote Participant connected: " + participant.getSid());
    }

    ...

  };
}
