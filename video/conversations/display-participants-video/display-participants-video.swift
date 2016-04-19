func participant(participant: TWCParticipant, addedVideoTrack videoTrack: TWCVideoTrack) {
    NSLog("Video added for participant: %@", participant.identity)
    videoTrack.attach(remoteVideo)
    videoTrack.delegate = self
}


// First, we set a Participant Delegate when a Participant first connects: 

// MARK: TWCConversationDelegate
func conversation(conversation: TWCConversation, didConnectParticipant participant: TWCParticipant) {
 	print("Participant connected: " + participant.identity!)
	participant.delegate = self    
}


/* In the Participant Delegate, we can respond when the Participant adds a Video
Track by rendering it on screen: */

// MARK: TWCParticipantDelegate
func participant(participant: TWCParticipant, addedVideoTrack videoTrack: TWCVideoTrack) {
    print("Participant: \(participant.identity!) added a Video Track")
	/* The iOS SDK provides a convenience method to 'attach' a Video Track to a
	UIView without needing to explicitly instantiate a renderer */
	videoTrack.attach(self.remoteMediaView)
	videoTrack.delegate = self
}

// Lastly, we can subscribe to important events on the Video Track

// MARK: TWCVideoTrackDelegate
func videoTrack(track: TWCVideoTrack, dimensionsDidChange dimensions: CMVideoDimensions) {
    print("The dimensions of the video track changed to: \(dimensions.width)x\(dimensions.height)")
}
