room.on('trackAdded', function(track, participant) {
  if (track.kind == 'video') {
    const firstVideoElement = document.querySelector('video');
    track.attach(firstVideoElement);
  }
});
