client.inviteToConversation(['alice', 'bob']).then(
  conversation => {
    console.log('Successfully connected to Conversation: ' + conversation.sid);
    conversation.on('participantConnected', participant => {
      console.log('A remote Participant connected: ' + participant.sid);
    });
  },
  error => {
    console.error('Unable to connect to Conversation : ' + error.message);
  }
);
