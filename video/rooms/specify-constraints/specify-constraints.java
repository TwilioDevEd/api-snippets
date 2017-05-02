if (participant.getVideoTracks().size() == 0) {
  CameraCapturer cameraCapturer = new CameraCapturer(this, CameraSource.FRONT_CAMERA);
  LocalVideoTrack localVideoTrack = LocalVideoTrack.create(context, true, cameraCapturer);
}
