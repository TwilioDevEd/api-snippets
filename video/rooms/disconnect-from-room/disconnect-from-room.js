room.on('disconnected', room => {
  // Detach the local media elements
  room.localParticipant.tracks.forEach(track => {
    var attachedElements = track.detach();
    attachedElements.forEach(element => element.remove());
  });
});

// To disconnect from a Room
room.disconnect();
