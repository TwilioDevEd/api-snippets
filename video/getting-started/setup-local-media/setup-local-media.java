// Create a local media object
LocalMedia localMedia = LocalMedia.create(context);

// Add an audio track
boolean enable = true;
LocalAudioTrack localAudioTrack = localMedia.addAudioTrack(enable);

// A video track requires an implementation of VideoCapturer
CameraCapturer cameraCapturer = new CameraCapturer(context,
        CameraCapturer.CameraSource.FRONT_CAMERA);

// Add a video track
LocalVideoTrack localVideoTrack = localMedia.addVideoTrack(enable, cameraCapturer);

// Remove audio track
localMedia.removeAudioTrack(localAudioTrack);

// Remove video track
localMedia.removeVideoTrack(localVideoTrack);

// You must call release to ensure you free native resources
localMedia.release();
