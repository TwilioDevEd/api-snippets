const previewMedia = new Twilio.Conversations.LocalMedia();
previewMedia.addCamera().then(
  cameraTrack => {
    // attach to a <video> element
    cameraTrack.attach('#preview-video-element');
  },
  error => {
    console.error('Unable to get access to the local camera.');
  }
);
