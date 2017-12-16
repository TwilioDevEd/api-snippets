Twilio.Video
  .connect('$TOKEN', {
    name: 'my-room',
  })
  .then(
    function(room) {
      console.log('Connected to the Room "%s"', room.name);
    },
    function(error) {
      console.error('Failed to connect to the Room', error);
    }
  );
