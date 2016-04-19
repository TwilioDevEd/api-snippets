myConversation.on('participantConnected', function(participant) {
  console.log(participant.identity + ' joined the Conversation');

  // Get the participant's Media,
  var participantMedia = participant.media;

  // And attach it to your application's view.
  var participantView = document.getElementById('participant-view');
  participantMedia.attach(participantView);
  participantVideos.appendChild(participantView);
});

myConversation.on('participantDisconnected', function(participant) {
  console.log(participant.identity + ' left the Conversation');
});

myConversation.on('participantFailed', function(identity) {
  console.log(identity + ' failed to join the Conversation');
});