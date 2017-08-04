room.on('disconnected', function(room) {
  // Detach the local media elements
  room.localParticipant.tracks.forEach(function(track) {
    const attachedElements = track.detach();
    attachedElements.forEach(function(element) {
      return element.remove();
    });
  });
});

// To disconnect from a Room
room.disconnect();
