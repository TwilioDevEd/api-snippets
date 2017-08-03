conversation.on('participantConnected', function(participant) {
  console.log('Participant connected: ' + participant.identity);
});

conversation.on('participantFailed', function(participant) {
  console.log('Participant failed to connect: ' + participant.identity);
});

conversation.on('participantDisconnected', function(participant) {
  console.log('Participant disconnected: ' + participant.identity);
});
