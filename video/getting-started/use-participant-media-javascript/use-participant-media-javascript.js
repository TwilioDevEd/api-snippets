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

// You can attach Tracks to the DOM in the following manner
participant.tracks.forEach(track => {
  var mediaElement = track.attach();
  document.getElementById('track-view').appendChild(mediaElement);
});

// You can detach Tracks from the DOM in the following manner
participant.tracks.forEach(track => {
  var trackElements = track.detach();
  trackElements.forEach(element => element.remove());
});
