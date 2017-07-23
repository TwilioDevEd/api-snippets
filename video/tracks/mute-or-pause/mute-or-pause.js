const localMedia = room.localParticipant.media;
localMedia.tracks.forEach(track => {
  if (track.isEnabled) {
    track.disable();
  } else {
    track.enable();
  }
});
