room.on('participantConnected', function(participant) {
  console.log('Participant connected: ' + participant.identity);
});

room.on('participantDisconnected', function(participant) {
  console.log('Participant disconnected: ' + participant.identity);
});
