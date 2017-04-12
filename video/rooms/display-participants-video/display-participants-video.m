#pragma mark - TVIRoomDelegate

// First, we set a Participant Delegate when a Participant first connects: 
- (void)room:(TVIRoom *)room participantDidConnect:(TVIParticipant *)participant {
    NSLog(@"Participant did connect:%@",participant.identity);
	participant.delegate = self;
}

/* In the Participant Delegate, we can respond when the Participant adds a Video
Track by rendering it on screen:*/

#pragma mark - TVIVideoViewDelegate

- (void)participant:(TVIParticipant *)participant addedVideoTrack:(TVIVideoTrack *)videoTrack {
    NSLog(@"Participant %@ added a video track",participant.identity);
    
    self.remoteMediaView = [[TVIVideoView alloc] initWithFrame:self.view.bounds delegate:self];
    [videoTrack addRenderer:self.remoteMediaView];
}

// Lastly, we can subscribe to important events on the Video Track

#pragma mark - TVIVideoViewDelegate

- (void)videoView:(TVIVideoView *)view videoDimensionsDidChange:(CMVideoDimensions)dimensions {
    NSLog(@"Dimensions changed to: %d x %d", dimensions.width, dimensions.height);
    [self.view setNeedsLayout];
}

