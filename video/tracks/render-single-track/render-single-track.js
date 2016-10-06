room.on('trackAdded', function(track, participant) {
  if (track.kind == 'video') {
    var firstVideoElement = document.querySelector('video');
    track.attach(firstVideoElement);
  }
});