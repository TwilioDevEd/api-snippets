@Override
public void onVideoTrackAdded(Conversation conversation, Participant participant, VideoTrack videoTrack) {
    Log.i(TAG, "onVideoTrackAdded " + participant.getIdentity());
    conversationStatusTextView.setText("onVideoTrackAdded " + participant.getIdentity());

    // Remote participant
    participantVideoRenderer = new VideoViewRenderer(ConversationActivity.this, participantContainer);
    participantVideoRenderer.setObserver(new VideoRendererObserver() {

    @Override
    public void onFirstFrame() {
        Log.i(TAG, "Participant onFirstFrame");
    }

    @Override
    public void onFrameDimensionsChanged(int width, int height) {
        Log.i(TAG, "Participant onFrameDimensionsChanged " + width + " " + height);
    } 
 
    videoTrack.addRenderer(participantVideoRenderer);
}
