participant.on('trackAdded', function(track) {
  if (track.kind === 'audio') {
    console.log('Added an AudioTrack %s', track.id);
  } else {
    console.log('Added a VideoTrack %s', track.id);
  }
});

participant.on('trackRemoved', function(track) {
  if (track.kind === 'audio') {
    console.log('Removed an AudioTrack %s', track.id);
  } else {
    console.log('Removed a VideoTrack %s', track.id);
  }
});

participant.on('trackEnabled', function(track) {
  if (track.kind === 'audio') {
    console.log('Enabled AudioTrack %s', track.id);
  } else {
    console.log('Enabled VideoTrack %s', track.id);
  }
});

participant.on('trackDisabled', function(track) {
  if (track.kind === 'audio') {
    console.log('Disabled AudioTrack %s', track.id);
  } else {
    console.log('Disabled VideoTrack %s', track.id);
  }
});

// You can attach Tracks to the DOM in the following manner
participant.tracks.forEach(function(track) {
  const mediaElement = track.attach();
  document.getElementById('track-view').appendChild(mediaElement);
});

// You can detach Tracks from the DOM in the following manner
participant.tracks.forEach(function(track) {
  const trackElements = track.detach();
  trackElements.forEach(function(element) {
    return element.remove();
  });
});
