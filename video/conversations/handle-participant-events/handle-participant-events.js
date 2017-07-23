conversation.on('participantConnected', participant => {
  console.log('Participant connected: ' + participant.identity);
});

conversation.on('participantFailed', participant => {
  console.log('Participant failed to connect: ' + participant.identity);
});

conversation.on('participantDisconnected', participant => {
  console.log('Participant disconnected: ' + participant.identity);
});
