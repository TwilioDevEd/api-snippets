Twilio.Video.connect('$TOKEN', { name: 'existing-room' }).then(
  function(room) {
    console.log('Successfully joined a Room: ', room);
    room.on('participantConnected', function(participant) {
      console.log('A remote Participant connected: ', participant);
    });
  },
  function(error) {
    console.error('Unable to connect to Room: ' + error.message);
  }
);
