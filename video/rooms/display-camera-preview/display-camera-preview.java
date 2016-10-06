/* The CameraCapturer is a default video capturer provided by Twilio which can
   capture video from the front or rear-facing device camera */
private CameraCapturer cameraCapturer;

/* A VideoView receives frames from a local or remote video track and renders them
   to an associated view. */
private VideoView primaryVideoView;

/*  LocalMedia represents our local camera and microphone (media) configuration
    that can be sent to other Participants in Rooms, or previewed locally */
private LocalMedia localMedia = LocalMedia.create(this);

// Initialize the camera capturer and start the camera preview
cameraCapturer = new CameraCapturer(this, CameraSource.FRONT_CAMERA, null);
LocalVideoTrack localVideoTrack = localMedia.addVideoTrack(true, cameraCapturer);
primaryVideoView.setMirror(true);
localVideoTrack.addRenderer(primaryVideoView);

