const localMedia = room.localParticipant.media;
localMedia.tracks.forEach(function(track) {
  if (track.isEnabled) {
    track.disable();
  } else {
    track.enable();
  }
});
