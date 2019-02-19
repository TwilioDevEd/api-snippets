// Create an AccessManager to manage our Access Token
AccessManager accessManager = new AccessManager(ConversationActivity.this,
                                ACCESS_TOKEN,
                                accessManagerListener());

// Create a Conversations Client and connect to Twilio's backend.
TwilioConversationsClient conversationsClient =
  TwilioConversationsClient.create(accessManager, conversationsClientListener());
conversationsClient.listen();

/* See the "Working with Conversations" guide for instructions on constructing a
ConversationsClientListener */
private TwilioConversationsClient.Listener conversationsClientListener() {
  return new TwilioConversationsClient.Listener() {
    @Override
    public void onStartListeningForInvites(TwilioConversationsClient conversationsClient) {
      Log.i(TAG, "Connected to Twilio!");
    }

    ...

  };
}
