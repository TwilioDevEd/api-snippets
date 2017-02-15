// First, we set a Participant Delegate when a Participant first connects: 

// MARK: TVIRoomDelegate
func room(_ room: TVIRoom, participantDidConnect participant: TVIParticipant) {
	print("Participant connected: \(participant.identity!)")
	participant.delegate = self
}

/* In the Participant Delegate, we can respond when the Participant adds a Video
Track by rendering it on screen: */

// MARK: TVIParticipantDelegate
func participant(_ participant: TVIParticipant, addedVideoTrack videoTrack: TVIVideoTrack) {
	print("Participant \(participant.identity) added video track")
	videoTrack.attach(self.remoteMediaView)
	videoTrack.delegate = self
}


// Lastly, we can subscribe to important events on the Video Track

// MARK: TVIVideoTrackDelegate
func videoTrack(_ track: TVIVideoTrack, dimensionsDidChange dimensions: CMVideoDimensions) {
	print("The dimensions of the video track changed to: \(dimensions.width)x\(dimensions.height)")
}
