client.inviteToConversation('alice').then(
  function(conversation) {
    console.log('Successfully connected to Conversation: ' + conversation);
    conversation.on('participantConnected', function(participant) {
      console.log('A remote Participant connected: ' + participant);
    });
  },
  function(error) {
    console.error('Unable to connect to Conversation: ' + error.message);
  }
);
