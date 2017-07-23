const { createLocalVideoTrack } = require('twilio-video');

createLocalVideoTrack().then(track => {
  let localMediaContainer = document.getElementById('local-media-ctr');
  localMediaContainer.appendChild(track.attach());
});
