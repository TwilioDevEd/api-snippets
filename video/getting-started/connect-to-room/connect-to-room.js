Twilio.Video
  .connect('$TOKEN', {
    name: 'my-room',
  })
  .then(
    room => {
      console.log('Connected to the Room "%s"', room.name);
    },
    error => {
      console.error('Failed to connect to the Room', error);
    }
  );
