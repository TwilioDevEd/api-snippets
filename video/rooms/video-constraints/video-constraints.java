// Create camera capturer
CameraCapturer cameraCapturer = new CameraCapturer(context, 
    CameraCapturer.CameraSource.FRONT_CAMERA);
    
// Setup video constraints
VideoConstraints videoConstraints = new VideoConstraints.Builder()
    .aspectRatio(VideoConstraints.ASPECT_RATIO_16_9)
    .minVideoDimensions(VideoDimensions.CIF_VIDEO_DIMENSIONS)
    .maxVideoDimensions(VideoDimensions.HD_720P_VIDEO_DIMENSIONS)
    .minFps(5)
    .maxFps(24)
    .build();

// Add a video track with constraints
LocalVideoTrack localVideoTrack = LocalVideoTrack.create(context, true, cameraCapturer, videoConstraints);

// If the constraints are not satisfied a null track will be returned
if (localVideoTrack == null) {
    Log.e(TAG, "Unable to satisfy constraints);
}
