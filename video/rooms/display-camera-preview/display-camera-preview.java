/* The CameraCapturer is a default video capturer provided by Twilio which can
   capture video from the front or rear-facing device camera */
private CameraCapturer cameraCapturer;

/* A VideoView receives frames from a local or remote video track and renders them
   to an associated view. */
private VideoView primaryVideoView;

// Initialize the camera capturer and start the camera preview
cameraCapturer = new CameraCapturer(this, CameraSource.FRONT_CAMERA);
LocalVideoTrack localVideoTrack = LocalVideoTrack.create(context, true, cameraCapturer);
primaryVideoView.setMirror(true);
localVideoTrack.addRenderer(primaryVideoView);

// Release the local video track to free native memory resources once you are done
localVideoTrack.release();
