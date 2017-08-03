// Attach the Participant's Media to a <div> element.
room.on('participantConnected', function(participant) {
  console.log('Participant "' + participant.identity + '" connected');

  participant.tracks.forEach(function(track) {
    document.getElementById('remote-media-div').appendChild(track.attach());
  });
});
