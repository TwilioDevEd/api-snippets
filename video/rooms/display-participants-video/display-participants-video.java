// First, we set a Media Listener when a Participant first connects:
private Room.Listener roomListener() {
  return new Room.Listener() {
    @Override
    public void onParticipantConnected(Room room, Participant participant) {
      participant.getMedia().setListener(mediaListener());
    }
  };
}

/* In the Media Listener, we can respond when the Participant adds a Video
Track by rendering it on screen: */
private Media.Listener mediaListener() {
  return new Media.Listener() {
      @Override
      public void onVideoTrackAdded(Media media, VideoTrack videoTrack) {
        primaryVideoView.setMirror(false);
        videoTrack.addRenderer(primaryVideoView);
      }
  };
}
