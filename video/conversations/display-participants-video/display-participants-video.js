// #remote-media is a &lt;div&gt; element for displaying another party's video
conversation.on('participantConnected', function(participant) {
  console.log("Participant '" +  participant.identity  + "' connected");
  // Pass in a CSS selector for the DOM element where you'd like to show
  // a participant's video
  participant.media.attach('#remote-media');
});