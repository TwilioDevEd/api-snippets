var previewMedia = new Twilio.Video.LocalMedia();
Twilio.Video.getUserMedia().then(
  function (mediaStream) {
    previewMedia.addStream(mediaStream);
    previewMedia.attach('#local-media');
  },
  function (error) {
    console.error('Unable to access local media', error);
  });
