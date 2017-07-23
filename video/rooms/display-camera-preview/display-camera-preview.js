const { createLocalVideoTrack } = require('twilio-video');

createLocalVideoTrack().then(track => {
  var localMediaContainer = document.getElementById('local-media-ctr');
  localMediaContainer.appendChild(track.attach());
});
