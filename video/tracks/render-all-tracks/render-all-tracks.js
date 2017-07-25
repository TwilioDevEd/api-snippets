const container = document.getElementById('participant-media');

// attach all of this Participant's audio and video tracks to a certain &lt;div&gt;
room.on('participantConnected', participant => {
  participant.media.attach(container);
});
