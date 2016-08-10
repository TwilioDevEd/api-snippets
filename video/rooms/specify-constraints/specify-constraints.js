// Create LocalMedia with a camera track and no microphone track
var localMedia = new Twilio.Video.LocalMedia();
localMedia.addCamera().then(function() {
  return client.connect('my-room', { localMedia: localMedia });
});


// Or, more simply:
return client.connect('my-room', {
  localStreamConstraints: { audio: false }
});