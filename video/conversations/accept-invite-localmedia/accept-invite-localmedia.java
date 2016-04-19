LocalMedia localMedia = setupLocalMedia();
invite.accept(localMedia, new ConversationCallback() {
    @Override
    public void onConversation(Conversation conversation, ConversationException e) {
        Log.e(TAG, "sendConversationInvite onConversation");
        if (e == null) {
            ConversationActivity.this.conversation = conversation;
            conversation.setConversationListener(conversationListener());
        } else {
            Log.e(TAG, e.getMessage());
            hangup();
            reset();
        }    
    }
});
