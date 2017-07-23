// set up the listener for the typing started Channel event
activeChannel.on('typingStarted', function(member) {
  // process the member to show typing
  updateTypingIndicator(member, true);
});

// set  the listener for the typing started Channel event
activeChannel.on('typingStarted', function(member) {
  // process the member to stop showing typing
  updateTypingIndicator(member, false);
});
