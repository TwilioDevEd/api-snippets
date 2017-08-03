// preview local camera on screen
const previewMedia = new Twilio.Conversations.LocalMedia();
Twilio.Conversations.getUserMedia().then(
  function(mediaStream) {
    previewMedia.addStream(mediaStream);
    previewMedia.attach('#local-media');
  },
  function(error) {
    console.error('Unable to access local media', error);
  }
);

// use our previewMedia object when we accept a Conversation Invite
client.on('invite', function(invite) {
  invite.accept({
    localMedia: previewMedia,
  });
});
