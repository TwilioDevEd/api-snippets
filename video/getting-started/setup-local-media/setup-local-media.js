const {
  createLocalTracks,
  createLocalAudioTrack,
  createLocalVideoTrack,
} = require('twilio-video');

let localTracks;

// Create default local audio and video tracks
createLocalTracks().then(function(localTracks) {
  console.log('Got default audio and video tracks:', localTracks);
});

// Create default local track of a particular kind
createLocalAudioTrack().then(function(audioTrack) {
  console.log('Got default local audio track:', audioTrack);
});

createLocalVideoTrack().then(function(videoTrack) {
  console.log('Got default local video track:', videoTrack);
});
