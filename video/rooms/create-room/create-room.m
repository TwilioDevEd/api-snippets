-(void)createARoom {
	// Create a room 
	TVIConnectOptions *connectOptions = [TVIConnectOptions optionsWithBlock:^(TVIConnectOptionsBuilder * _Nonnull builder) {
		builder.name = @"my-new-room";
	}];
	TVIRoom *room = [videoClient connectWithOptions:connectOptions delegate:self];
}

#pragma mark - TVIRoomDelegate
- (void)room:(TVIRoom *)room participantDidConnect:(TVIParticipant *)participant {
	NSLog(@"Participant did connect:%@", participant.identity);
}