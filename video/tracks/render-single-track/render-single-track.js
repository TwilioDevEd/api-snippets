room.on('trackAdded', function(track, participant) {
  if (track.kind == 'video') {
    let firstVideoElement = document.querySelector('video');
    track.attach(firstVideoElement);
  }
});
