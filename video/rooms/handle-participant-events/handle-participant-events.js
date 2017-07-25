room.on('participantConnected', participant => {
  console.log('Participant connected: ' + participant.identity);
});

room.on('participantDisconnected', participant => {
  console.log('Participant disconnected: ' + participant.identity);
});
