participant.on('trackAdded', track => {
  if (track.kind === 'audio') {
    console.log('Added an AudioTrack %s', track.id);
  } else {
    console.log('Added a VideoTrack %s', track.id);
  }
});

participant.on('trackRemoved', track => {
  if (track.kind === 'audio') {
    console.log('Removed an AudioTrack %s', track.id);
  } else {
    console.log('Removed a VideoTrack %s', track.id);
  }
});

participant.on('trackEnabled', track => {
  if (track.kind === 'audio') {
    console.log('Enabled AudioTrack %s', track.id);
  } else {
    console.log('Enabled VideoTrack %s', track.id);
  }
});

participant.on('trackDisabled', track => {
  if (track.kind === 'audio') {
    console.log('Disabled AudioTrack %s', track.id);
  } else {
    console.log('Disabled VideoTrack %s', track.id);
  }
});

// You can attach a Participant's Media directly to a DOM element,
participant.media.attach(document.getElementById('#my-view'));

// You can pass the query selector directly,
participant.media.attach('#media-view');

// Or you can create a default element.
const element = participant.media.attach();
document.body.appendChild(element);

// In all three of these scenarios, as Tracks are added and removed, the
// attached element will be updated with the appropriate <audio> and <video>
// tags. If you would like to manage Track attachment yourself, you can always
// attach them manually. For example,
participant.media.tracks.forEach(track => {
  track.attach('#track-view');
});
