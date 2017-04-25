if (localVideoTrack == nil) {
    camera = TVICameraCapturer()
    localVideoTrack = TVILocalVideoTrack.init(capturer: camera!)
}
        
