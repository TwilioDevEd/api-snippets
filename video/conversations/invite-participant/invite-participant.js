conversation.invite('charles');
conversation.on('participantConnected', participant => {
  console.log('A remote Participant connected: ' + participant.identity);
});
