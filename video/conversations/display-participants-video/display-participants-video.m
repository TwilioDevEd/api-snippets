- (void)participant:(TWCParticipant *)participant 
    addedVideoTrack:(TWCVideoTrack *)videoTrack {
    NSLog(@"Video added for participant: %@", [participant identity]);

    // Attach the participant's media to a UIView
    [videoTrack attach:self.remoteVideoContainer];
    videoTrack.delegate = self;
}
