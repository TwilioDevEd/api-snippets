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

// Rendering a local video track requires an implementation of VideoRenderer
// Let's assume we have added a VideoView in our view hierarchy
VideoView videoView = (VideoView) findViewById(R.id.video_view);

// Render a local video track to preview your camera
localVideoTrack.addRenderer(videoView);

// Remove audio track
localMedia.removeAudioTrack(localAudioTrack);

// Remove video track
localMedia.removeVideoTrack(localVideoTrack);

// You must call release to ensure you free native resources
localMedia.release();
