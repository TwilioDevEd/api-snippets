room.on('disconnected', function(room) {
  /* Release the local camera and microphone if we're no longer using this 
  LocalMedia instance in another Room */
  room.localMedia.stop();
});

// To disconnect from a Room
room.disconnect();