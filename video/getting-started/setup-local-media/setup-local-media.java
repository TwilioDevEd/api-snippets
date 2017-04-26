// Create an audio track
boolean enable = true;
LocalAudioTrack localAudioTrack = LocalAudioTrack.create(context, enable);

// A video track requires an implementation of VideoCapturer
CameraCapturer cameraCapturer = new CameraCapturer(context,
        CameraCapturer.CameraSource.FRONT_CAMERA);

// Create a video track
LocalVideoTrack localVideoTrack = LocalVideoTrack.create(context, enable, cameraCapturer);

// Rendering a local video track requires an implementation of VideoRenderer
// Let's assume we have added a VideoView in our view hierarchy
VideoView videoView = (VideoView) findViewById(R.id.video_view);

// Render a local video track to preview your camera
localVideoTrack.addRenderer(videoView);

// Release the audio track to free native memory resources
localAudioTrack.release();

// Release the video track to free native memory resources
localVideoTrack.release();

