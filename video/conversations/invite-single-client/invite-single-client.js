client.inviteToConversation('alice').then(
  conversation => {
    console.log('Successfully connected to Conversation: ' + conversation);
    conversation.on('participantConnected', participant => {
      console.log('A remote Participant connected: ' + participant);
    });
  },
  error => {
    console.error('Unable to connect to Conversation: ' + error.message);
  }
);
