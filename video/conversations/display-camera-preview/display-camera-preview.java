private LocalMedia setupLocalMedia() {
    LocalMedia localMedia = LocalMediaFactory.createLocalMedia(localMediaListener());
    LocalVideoTrack localVideoTrack = LocalVideoTrackFactory.createLocalVideoTrack(cameraCapturer);
    if (pauseVideo) {
        localVideoTrack.enableCamera(false);
    }
    localMedia.addLocalVideoTrack(localVideoTrack);
    if (muteMicrophone) {
       localMedia.mute(true);
    }
    return localMedia;
}
