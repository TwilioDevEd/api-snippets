// Used to observe participant media events
Participant.Listener participantListener = new Participant.Listener() {
    @Override
    public void onAudioTrackAdded(Participant participant, AudioTrack audioTrack) {
        // Notifies you that an audio track has been added
    }

    @Override
    public void onAudioTrackRemoved(Participant participant, AudioTrack audioTrack) {
        // Notifies you that an audio track has been removed
    }

    @Override
    public void onVideoTrackAdded(Participant participant, VideoTrack videoTrack) {
        // Notifies you that an video track has been added
    }

    @Override
    public void onVideoTrackRemoved(Participant participant, VideoTrack videoTrack) {
        // Notifies you that an video track has been removed
    }

    @Override
    public void onAudioTrackEnabled(Participant participant, AudioTrack audioTrack) {
        // Notifies you that an audio track has been enabled
    }

    @Override
    public void onAudioTrackDisabled(Participant participant, AudioTrack audioTrack) {
        // Notifies you that an audio track has been disabled
    }

    @Override
    public void onVideoTrackEnabled(Participant participant, VideoTrack videoTrack) {
        // Notifies you that an video track has been enabled
    }

    @Override
    public void onVideoTrackDisabled(Participant participant, VideoTrack videoTrack) {
        // Notifies you that an video track has been disabled
    }
};

// Set the listener on the participant to listen to media track events
participant.setListener(participantListener);

// Like a LocalVideoTrack, a VideoTrack can be rendered with a VideoRenderer
VideoView videoView = (VideoView) findViewById(R.id.video_view);

// Render the first video track
VideoTrack videoTrack = participant.getVideoTracks().get(0);
videoTrack.addRenderer(videoView);

// To stop rendering simply remove the renderer from the video track
videoTrack.removeRenderer(videoView);
