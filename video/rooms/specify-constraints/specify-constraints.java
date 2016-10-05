if (localMedia.getVideoTracks().size() == 0) {
  CameraCapturer cameraCapturer = new CameraCapturer(this, CameraSource.FRONT_CAMERA, null);
  LocalVideoTrack localVideoTrack = localMedia.addVideoTrack(true, cameraCapturer);
}