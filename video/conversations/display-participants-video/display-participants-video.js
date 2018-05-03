// There are two options in the JavaScript SDK for displaying a remote party's video.

/* 1. We can attach the Participant's Media to a <div> element.
<audio> and <video> elements will be created and destroyed as
needed and appended to the <div>:*/
conversation.on('participantConnected', function(participant) {
  console.log('Participant "' + participant.identity + '" connected');
  participant.media.attach('#remote-media-div');
});

/* 2. We can attach a Participant's Audio and Video Tracks to individual
<audio> and <video> elements. */
participant.on('trackAdded', function(track) {
  if (track.kind == 'audio') {
    track.attach('#remote-audio-element');
  } else {
    track.attach('#remote-video-element');
  }
});
