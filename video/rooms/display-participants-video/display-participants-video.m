// First, we set a Participant Delegate when a Participant first connects: 
#pragma mark - TWCConversationDelegate

- (void)conversation:(TWCConversation *)conversation didConnectParticipant:(TWCParticipant *)participant
{
	NSLog(@"Participant connected: %@", [participant identity]);
	participant.delegate = self;
}


/* In the Participant Delegate, we can respond when the Participant adds a Video
Track by rendering it on screen:*/

#pragma mark - TWCParticipantDelegate

- (void)participant:(TWCParticipant *)participant 
	addedVideoTrack:(TWCVideoTrack *)videoTrack {
	NSLog(@"Participant: %@ added a Video Track", [participant identity]);

	/* The iOS SDK provides a convenience method to 'attach' a Video Track to a
	UIView without needing to explicitly instantiate a renderer */
	[videoTrack attach:self.remoteVideoContainer];
	videoTrack.delegate = self;
}

// Lastly, we can subscribe to important events on the Video Track
#pragma mark - TWCVideoTrackDelegate

- (void)videoTrack:(TWCVideoTrack *)track dimensionsDidChange:(CMVideoDimensions)dimensions
{
	NSLog(@"The dimensions of the video track changed to: %dx %d", 
		dimensions.width, dimensions.height);
	[self.view setNeedsUpdateConstraints];
}
