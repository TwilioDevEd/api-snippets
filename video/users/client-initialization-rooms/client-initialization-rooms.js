$.getJSON('/token', data => {
  // Create a Video Client and connect to Twilio's backend
  Twilio.Video.connect('$TOKEN', { name: 'my-room' }).then(
    room => {
      console.log('Connected to Twilio!');
    },
    error => {
      console.log('Could not connect to Twilio: ' + error.message);
    }
  );
});
