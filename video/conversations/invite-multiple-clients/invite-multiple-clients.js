client.inviteToConversation(['alice', 'bob']).then(
  function(conversation) {
    console.log('Successfully connected to Conversation: ' + conversation.sid);
    conversation.on('participantConnected', function(participant) {
      console.log('A remote Participant connected: ' + participant.sid);
    });
  },
  function(error) {
    console.error('Unable to connect to Conversation : ' + error.message);
  }
);
