if (localMedia?.videoTracks.count == 0) {
      camera = TVICameraCapturer()
    localVideoTrack = localMedia?.addVideoTrack(true, capturer: camera!)
}
        