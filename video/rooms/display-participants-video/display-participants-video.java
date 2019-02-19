// First, we set a Media Listener when a Participant first connects:
private Room.Listener roomListener() {
  return new Room.Listener() {
    @Override
    public void onParticipantConnected(Room room, Participant participant) {
      participant.setListener(participantListener());
    }
  };
}

/* In the Participant listener, we can respond when the Participant adds a Video
Track by rendering it on screen: */
private Participant.Listener participantListener() {
  return new Participant.Listener() {
      @Override
      public void onVideoTrackAdded(Participant participant, VideoTrack videoTrack) {
        primaryVideoView.setMirror(false);
        videoTrack.addRenderer(primaryVideoView);
      }
  };
}
