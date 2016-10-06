if ([self.localMedia.videoTracks count] == 0) {
	self.camera = [[TVICameraCapturer alloc] init];
	self.localVideoTrack = [self.localMedia addVideoTrack:YES capturer:self.camera];
}