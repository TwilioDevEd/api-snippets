// First, we set a Participant Listener when a Participant first connects:
private Conversation.Listener conversationListener() {
  return new Conversation.Listener() {
    @Override
    public void onParticipantConnected(Conversation conversation,
                                       Participant participant) {
      participant.setParticipantListener(participantListener());
    }

    ...

}

/* In the Participant Listener, we can respond when the Participant adds a Video
Track by rendering it on screen: */

private Participant.Listener participantListener() {
  return new Participant.Listener() {
    @Override
    public void onVideoTrackAdded(Conversation conversation,
                                  Participant participant,
                                  VideoTrack videoTrack) {
      Log.i(TAG, "The remote Participant added a Video Track");

      /* VideoViewRenderer is a renderer provided by Twilio that can
      render a Video Track onto a ViewGroup */
      participantVideoRenderer = new VideoViewRenderer(ConversationActivity.this,
                                                       remoteParticipantViewGroup);
      participantVideoRenderer.setObserver(new VideoRenderer.Observer() {

        /* The Renderer Observer allows us to subscribe to important
        events on the Video Track */
        @Override
        public void onFirstFrame() {
          Log.i(TAG, "The first frame of video content arrived.");
        }

        @Override
        public void onFrameDimensionsChanged(int width, int height) {
          Log.i(TAG, "The dimensions of the video track changed to: " +
                      width + "x" + height);
        }

      });
      videoTrack.addRenderer(participantVideoRenderer);
    }

    ...

  };
}
