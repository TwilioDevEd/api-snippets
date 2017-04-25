// Set the Participant Delegate to receive participant's events
participant.delegate = self;

// TVIVideoView where you want to render remote participant's video
@IBOutlet weak var remoteView: TVIVideoView!

// MARK: TVIParticipantDelegate

func participant(_ participant: TVIParticipant, addedVideoTrack videoTrack: TVIVideoTrack) {
    // Add remoteView on video track to render video
    videoTrack.addRenderer(remoteView);
}

func participant(_ participant: TVIParticipant, removedVideoTrack videoTrack: TVIVideoTrack) {
    // To stop rendering simply call removeRenderer
    videoTrack.removeRenderer(remoteView);
}

func participant(_ participant: TVIParticipant, addedAudioTrack audioTrack: TVIAudioTrack) {
    // A participant added an Audio Track
}

func participant(_ participant: TVIParticipant, removedAudioTrack audioTrack: TVIAudioTrack) {
    // A participant removed an Audio Track
}

func participant(_ participant: TVIParticipant, enabledTrack track: TVITrack) {
    // A participant enabled a Track
}

func participant(_ participant: TVIParticipant, disabledTrack track: TVITrack) {
    // A participant disabled a Track
}
