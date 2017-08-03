// To disconnect from a Conversation
conversation.disconnect();

conversation.on('disconnected', function(conversation) {
  /* Release the local camera and microphone if we're no longer using this
  LocalMedia instance in another Conversation */
  conversation.localMedia.stop();
});
