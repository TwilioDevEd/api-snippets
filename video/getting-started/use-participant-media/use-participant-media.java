// Used to observe media events of a participant
Media.Listener mediaListener = new Media.Listener() {
    @Override
    public void onAudioTrackAdded(Media media, AudioTrack audioTrack) {
        // Notifies you that an audio track has been added
    }

    @Override
    public void onAudioTrackRemoved(Media media, AudioTrack audioTrack) {
        // Notifies you that an audio track has been removed
    }

    @Override
    public void onVideoTrackAdded(Media media, VideoTrack videoTrack) {
        // Notifies you that an video track has been added
    }

    @Override
    public void onVideoTrackRemoved(Media media, VideoTrack videoTrack) {
        // Notifies you that an video track has been removed
    }

    @Override
    public void onAudioTrackEnabled(Media media, AudioTrack audioTrack) {
        // Notifies you that an audio track has been enabled
    }

    @Override
    public void onAudioTrackDisabled(Media media, AudioTrack audioTrack) {
        // Notifies you that an audio track has been disabled
    }

    @Override
    public void onVideoTrackEnabled(Media media, VideoTrack videoTrack) {
        // Notifies you that an video track has been enabled
    }

    @Override
    public void onVideoTrackDisabled(Media media, VideoTrack videoTrack) {
        // Notifies you that an video track has been disabled
    }
};

// Grab the participant's media and register our listener
Media media = participant.getMedia();
media.setListener(mediaListener);

// Rendering a video track requires an implementation of VideoRenderer
// Let's assume we have added a VideoView in our view hierarchy
VideoView videoView = (VideoView) findViewById(R.id.video_view);

// Render the first video track
VideoTrack videoTrack = media.getVideoTracks().get(0);
videoTrack.addRenderer(videoView);

// To stop rendering simply remove the renderer from the video track
videoTrack.removeRenderer(videoView);
