// Create LocalMedia with a camera track and no microphone track
var localMedia = new Twilio.Conversations.LocalMedia();
localMedia.addCamera().then(function() {
  return client.inviteToConversation('alice', { localMedia: localMedia });
});


// Or, more simply:
client.inviteToConversation('alice', {
  localStreamConstraints: { audio: false }
});