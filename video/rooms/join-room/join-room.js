Twilio.Video.connect('$TOKEN', { name: 'existing-room' }).then(
  room => {
    console.log('Successfully joined a Room: ', room);
    room.on('participantConnected', participant => {
      console.log('A remote Participant connected: ', participant);
    });
  },
  error => {
    console.error('Unable to connect to Room: ' + error.message);
  }
);
