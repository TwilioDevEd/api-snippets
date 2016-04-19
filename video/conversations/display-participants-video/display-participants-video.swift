func participant(participant: TWCParticipant, addedVideoTrack videoTrack: TWCVideoTrack) {
    NSLog("Video added for participant: %@", participant.identity);
    videoTrack.attach(remoteVideo);
    videoTrack.delegate = self;
}