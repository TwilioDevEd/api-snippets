conversation.disconnect();
conversation.on('ended', function(conversation) {
  conversation.localMedia.stop();
});
