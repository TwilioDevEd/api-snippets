const { createLocalVideoTrack } = require('twilio-video');

createLocalVideoTrack().then(function(track) {
  const localMediaContainer = document.getElementById('local-media-ctr');
  localMediaContainer.appendChild(track.attach());
});
