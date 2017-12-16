// MARK: TVIRoomDelegate

// First, we set a Participant Delegate when a Participant first connects:
func room(_ room: TVIRoom, participantDidConnect participant: TVIParticipant) {
	print("Participant connected: \(participant.identity!)")
	participant.delegate = self
}

// MARK: TVIParticipantDelegate

/* 
 * In the Participant Delegate, we can respond when the Participant adds a Video
 * Track by rendering it on screen.
 */
func participant(_ participant: TVIParticipant, addedVideoTrack videoTrack: TVIVideoTrack) {
	print("Participant \(participant.identity) added video track")
    
	self.remoteView = TVIVideoView.init(frame: self.view.bounds, delegate:self)
	videoTrack.addRenderer(self.remoteView)

    self.view.addSubview(self.remoteView!)
}


// MARK: TVIVideoViewDelegate

// Lastly, we can subscribe to important events on the VideoView
func videoView(_ view: TVIVideoView, videoDimensionsDidChange dimensions: CMVideoDimensions) {
    print("The dimensions of the video track changed to: \(dimensions.width)x\(dimensions.height)")
    self.view.setNeedsLayout()
}
