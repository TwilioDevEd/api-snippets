/* Create an AccessManager - this provides a single place to update your Twilio 
Access Token when using multiple Twilio SDKs */
accessManager = TwilioAccessManagerFactory
  .createAccessManager(TWILIO_ACCESS_TOKEN, accessManagerListener());

// Create a Conversations Client and listen for IncomingInvites
conversationsClient = TwilioConversations
    .createConversationsClient(accessManager, conversationsClientListener());
conversationsClient.listen();

private ConversationsClientListener conversationsClientListener() {
  return new ConversationsClientListener() {
    @Override
    public void onStartListeningForInvites(ConversationsClient conversationsClient) {
      Log.i(TAG, "Connected to Twilio!");
    }

    ...

    @Override
    public void onIncomingInvite(ConversationsClient conversationsClient, 
                                 IncomingInvite incomingInvite) {
      // Selectively handle IncomingInvites based on the originator
      if (incomingInvite.getInvitee().equals("ringo")) {
        incomingInvite.reject();
      } else {
      /* See the "Specify Local Media Constraints when Creating a Conversation"
        guide for instructions on constructing LocalMedia */
        invite.accept(localMedia, new ConversationCallback());
      }
    }

    ...

  };
}