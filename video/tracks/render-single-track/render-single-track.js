room.on('trackAdded', (track, participant) => {
  if (track.kind == 'video') {
    const firstVideoElement = document.querySelector('video');
    track.attach(firstVideoElement);
  }
});
