const previewMedia = new Twilio.Conversations.LocalMedia();
previewMedia.addCamera().then(
  function(cameraTrack) {
    // attach to a <video> element
    cameraTrack.attach('#preview-video-element');
  },
  function(error) {
    console.error('Unable to get access to the local camera.');
  }
);
