conversation.invite(['charles', 'dena']);
conversation.on('participantConnected', function(participant) {
  if (participant.identity == 'charles') {
    console.log('Charles has connected.');
  } else if (participant.identity == 'dena') {
    console.log('Dena has connected.');
  }
});
