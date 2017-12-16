-(void)joinRoom {
	// Join an existing room 
	TVIConnectOptions *connectOptions = [TVIConnectOptions optionsWithBlock:^(TVIConnectOptionsBuilder * _Nonnull builder) {
		builder.roomName = @"existing-room";
	}];
	TVIRoom *room = [videoClient connectWithOptions:connectOptions delegate:self];
}

#pragma mark - TVIRoomDelegate

- (void)room:(TVIRoom *)room participantDidConnect:(TVIParticipant *)participant {
	NSLog(@"Participant did connect:%@", participant.identity);
}
