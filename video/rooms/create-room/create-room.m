-(void)createARoom {
    // Create a room 
    TVIConnectOptions *connectOptions = [TVIConnectOptions optionsWithToken:self.accessToken
                                                                      block:^(TVIConnectOptionsBuilder * _Nonnull builder) {
        builder.roomName = @"my-new-room";
    }];
    TVIRoom *room = [TVIVideoClient connectWithOptions:connectOptions delegate:self];
}

#pragma mark - TVIRoomDelegate

- (void)didConnectedToRoom:(nonnull TVIRoom *)room {
    NSLog(@"Did connect to Room");
}
