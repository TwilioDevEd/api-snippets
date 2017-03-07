TVIConnectOptions *connectOptions = [TVIConnectOptions optionsWithToken:self.accessToken
                                                                  block:^(TVIConnectOptionsBuilder * _Nonnull builder) {
    builder.roomName = @"my-room";
    builder.localMedia = self.localMedia;
}];
TVIRoom *room = [TVIVideoClient connectWithOptions:connectOptions delegate:self];

#pragma mark - TVIRoomDelegate

- (void)didConnectedToRoom:(nonnull TVIRoom *)room {
    // The Local Participant
    TVILocalParticipant *localParticipant = room.localParticipant;
    NSLog(@"Local Participant %@", localParticipant.identity);
    
    // Connected participants
    NSArray *participants = room.participants;
    NSLog(@"Number of connected Participants %ld", [participants count]);
}

- (void)room:(nonnull TVIRoom *)room participantDidConnect:(nonnull TVIParticipant *)participant {
    NSLog(@"Participant %@ has joined Room %@", participant.identity, room.name);
}

- (void)room:(nonnull TVIRoom *)room participantDidDisconnect:(nonnull TVIParticipant *)participant {
    NSLog(@"Participant %@ has left Room %@", participant.identity, room.name);
}
