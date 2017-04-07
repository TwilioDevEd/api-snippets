// Set the Participant Delegate to receive participant's events
participant.delegate = self;

// UIView where you want to render remote participant's video
@property (nonatomic, weak) IBOutlet UIView *remoteView;

#pragma mark - TVIParticipantDelegate

- (void)participant:(nonnull TVIParticipant *)participant addedVideoTrack:(nonnull TVIVideoTrack *)videoTrack {
    // Attach remoteView on video track to render video
    [videoTrack attach:self.remoteView];
}

- (void)participant:(nonnull TVIParticipant *)participant removedVideoTrack:(nonnull TVIVideoTrack *)videoTrack {
    // To stop rendering simply call detach
    [videoTrack detach:self.remoteView];
}
- (void)participant:(nonnull TVIParticipant *)participant addedAudioTrack:(nonnull TVIAudioTrack *)audioTrack {
    // A Participant added an Audio Track
}

- (void)participant:(nonnull TVIParticipant *)participant removedAudioTrack:(nonnull TVIAudioTrack *)audioTrack {
    // A Participant removed an Audio Track
}

- (void)participant:(nonnull TVIParticipant *)participant enabledTrack:(nonnull TVITrack *)track {
    // A Participant enabled a Track
}

- (void)participant:(nonnull TVIParticipant *)participant disabledTrack:(nonnull TVITrack *)track {
    // A Participante disabled a Track
}
