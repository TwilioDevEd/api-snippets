conversation.invite('charles');
conversation.on('participantConnected', function(participant) {
  console.log('A remote Participant connected: ' + participant.identity);
});
