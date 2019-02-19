// MARK: TVIParticipantDelegate

func participant(_ participant: TVIParticipant, addedVideoTrack videoTrack: TVIVideoTrack) {
    NSLog("Participant \(participant.identity) added video track")
}

func participant(_ participant: TVIParticipant, removedVideoTrack videoTrack: TVIVideoTrack) {
    NSLog("Participant \(participant.identity) removed video track")
}
