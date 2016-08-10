/* The CameraCapturer is a default video capturer provided by Twilio which can
capture video from the front or rear-facing device camera */
private CameraCapturer cameraCapturer;

// Retrieve the FrameLayout that we will preview our camera on
private FrameLayout previewFrameLayout;
previewFrameLayout = (FrameLayout) findViewById(R.id.previewFrameLayout);

// Initialize the camera capturer and start the camera preview
cameraCapturer = CameraCapturer.create(ConversationActivity.this,
                          CameraCapturer.CameraSource.CAMERA_SOURCE_FRONT_CAMERA,
                          capturerErrorListener());
startPreview(previewFrameLayout);

// Handle Camera Capturer errors
private CapturerErrorListener capturerErrorListener() {
  return new CapturerErrorListener() {
    @Override
    public void onError(CapturerException e) {
      Log.e(TAG, "Camera capturer error: " + e.getMessage());
    }
  };
}
