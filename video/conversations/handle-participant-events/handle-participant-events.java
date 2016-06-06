private Conversation.Listener conversationListener() {
  return new Conversation.Listener() {
    @Override
    public void onParticipantConnected(Conversation conversation,
                       Participant participant) {
      Log.v(TAG, "Participant connected: " + participant.getIdentity());
    }

    @Override
    public void onFailedToConnectParticipant(Conversation conversation,
                         Participant participant,
                         ConversationException e) {
      Log.e(TAG, "Participant failed to connect: " + e.getMessage());
    }

    @Override
    public void onParticipantDisconnected(Conversation conversation,
                        Participant participant) {
      Log.v(TAG, "Participant disconnected: " + participant.getIdentity());
    }

    ...

  };
}
