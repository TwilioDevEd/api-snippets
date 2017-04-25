if (localVideoTrack == nil) {
    camera = TVICameraCapturer()
    self.localVideoTrack = TVILocalVideoTrack.init(capturer: camera!)
}

if (localAudioTrack == nil) {
    self.localAudioTrack = TVIAudioTrack.init()
}

let connectOptions = TVIConnectOptions.init(token: accessToken) { (builder) in
    builder.roomName = "my-room"
    builder.audioTracks = [self.localAudioTrack!]
    builder.videoTracks = [self.localVideoTrack!]
}

room = TwilioVideo.connect(with: connectOptions, delegate: self)
        
