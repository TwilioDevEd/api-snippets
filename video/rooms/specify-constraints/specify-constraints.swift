if (self.localVideoTrack == nil) {
    self.camera = TVICameraCapturer()
    self.localVideoTrack = TVILocalVideoTrack.init(capturer: self.camera!)
}

if (self.localAudioTrack == nil) {
    self.localAudioTrack = TVILocalAudioTrack.init()
}

let connectOptions = TVIConnectOptions.init(token: accessToken) { (builder) in
    builder.roomName = "my-room"
    builder.audioTracks = [ self.localAudioTrack! ]
    builder.videoTracks = [ self.localVideoTrack! ]
}

var room = TwilioVideo.connect(with: connectOptions, delegate: self)
