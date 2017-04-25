let connectOptions = TVIConnectOptions.init(token: accessToken) { (builder) in
    builder.roomName = "my-room"
    builder.audioTracks = [ self.localAudioTrack! ]
    builder.videoTracks = [ self.localVideoTrack! ]
}

room = TwilioVideo.connect(with: connectOptions, delegate: self)

// MARK: TVIRoomDelegate

func didConnect(to room: TVIRoom) {
    // The Local Participant
    let localParticipant = room.localParticipant;
    print("Local identity \(localParticipant.identity)")
    
    // Connected participants
    let participants = room.participants;
    print("Number of connected Participants \(participants.count)")
}

func room(_ room: TVIRoom, participantDidConnect participant: TVIParticipant) {
    print ("Participant \(participant.identity) has joined Room \(room.name)")
}

func room(_ room: TVIRoom, participantDidDisconnect participant: TVIParticipant) {
    print ("Participant \(participant.identity) has left Room \(room.name)")
}
