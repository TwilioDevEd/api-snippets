const {
  createLocalTracks,
  createLocalAudioTrack,
  createLocalVideoTrack
} = require('twilio-video');

var localTracks;

// Create default local audio and video tracks
createLocalTracks().then(localTracks => {
  console.log('Got default audio and video tracks:', localTracks);
});

// Create local tracks using constraints
createLocalTracks({
  audio: true,
  video: { width: 640, height: 360 }
}).then(localTracks => {
  console.log('Got audio and video tracks with constraints:', localTracks);
});

// Local track events
function trackEventListener(track, event) {
  return () => console.log('Track ' + track.id + ' ' + event);
}
localTracks.forEach(track => {
  track.on('started', trackEventListener(track, 'started'));
  track.on('stopped', trackEventListener(track, 'stopped'));
  track.on('enabled', trackEventListener(track, 'enabled'));
  track.on('disabled', trackEventListener(track, 'disabled'));
});

// Create default local track of a particular kind
createLocalAudioTrack().then(audioTrack => {
  console.log('Got default local audio track:', audioTrack);
});
createLocalVideoTrack().then(videoTrack => {
  console.log('Got default local video track:', videoTrack);
});

// Create local track of a particular kind with constraints
createLocalAudioTrack({ deviceId: 'audio-input-device-id' }).then(audioTrack => {
  console.log('Got local audio track with constraints:', audioTrack);
});
createLocalVideoTrack({ width: 640, height: 360 }).then(videoTrack => {
  console.log('Got local video track with constraints:', videoTrack);
});