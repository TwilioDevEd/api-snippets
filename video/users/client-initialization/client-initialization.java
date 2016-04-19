// Create an AccessManager to manage our Access Token
TwilioAccessManager accessManager = TwilioAccessManagerFactory.createAccessManager(ACCESS_TOKEN, 
                                accessManagerListener());

// Create a Conversations Client and connect to Twilio's backend.
ConversationsClient conversationsClient = 
  TwilioConversations.createConversationsClient(accessManager, conversationsClientListener());
conversationsClient.listen();

/* See the "Working with Conversations" guide for instructions on constructing a
ConversationsClientListener */ 
private ConversationsClientListener conversationsClientListener() {
  return new ConversationsClientListener() {
    @Override
    public void onStartListeningForInvites(ConversationsClient conversationsClient) {
      Log.i(TAG, "Connected to Twilio!");
    }

    ...

  };
}