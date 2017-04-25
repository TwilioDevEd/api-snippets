if (!self.localVideoTrack) {
	self.camera = [[TVICameraCapturer alloc] init];
    self.localVideoTrack = [TVILocalVideoTrack trackWithCapturer:self.camera];
}
