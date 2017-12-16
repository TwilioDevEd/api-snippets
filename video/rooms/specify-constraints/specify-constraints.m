if (!self.localVideoTrack) {
	self.camera = [[TVICameraCapturer alloc] init];
    self.localVideoTrack = [TVILocalVideoTrack trackWithCapturer:self.camera];
}

if (!self.localAudioTrack) {
    self.localAudioTrack = [TVILocalVideoTrack track];
}

TVIConnectOptions *connectOptions = [TVIConnectOptions optionsWithToken:self.accessToken
                                                                  block:^(TVIConnectOptionsBuilder * _Nonnull builder) {
    builder.roomName = @"my-room";
    builder.audioTracks = @[ self.localAudioTrack ];
    builder.videoTracks = @[ self.localVideoTrack ];
}];

TVIRoom *room = [TwilioVideo connectWithOptions:connectOptions delegate:self];
