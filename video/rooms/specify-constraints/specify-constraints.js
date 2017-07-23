const { connect, createLocalTracks } = require('twilio-video');

// Option 1
createLocalTracks({
  audio: true,
  video: { width: 640 },
})
  .then(localTracks => {
    return connect('$TOKEN', {
      name: 'my-room-name',
      tracks: localTracks,
    });
  })
  .then(room => {
    console.log('Connected to Room:', room.name);
  });

// Option 2
connect('$TOKEN', {
  audio: true,
  name: 'my-room-name',
  video: { width: 640 },
}).then(room => {
  console.log('Connected to Room:', room.name);
});
