var previewMedia = new Twilio.Conversations.LocalMedia();
Twilio.Conversations.getUserMedia().then(function(mediaStream) {
    previewMedia.addStream(mediaStream);
    // Attach your local video stream to a DOM element
    previewMedia.attach('#local-media');
}, function(error) {
    console.error("Unable to access local media " + error);
    log("Unable to access Camera and Microphone");
});