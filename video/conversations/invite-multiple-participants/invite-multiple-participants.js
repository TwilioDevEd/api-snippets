conversation.invite(['bob', 'charlie']);
conversation.on('participantConnected', function(participant) {
  if (participant.identity === 'bob') {
    console.log('Bob has connected');
  } else if (participant.identity === 'charlie') {
    console.log('Charlie has connected');
  }
});
