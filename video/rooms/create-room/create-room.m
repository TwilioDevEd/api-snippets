-(void)createARoom {
    // Create a room 
    TVIConnectOptions *connectOptions = [TVIConnectOptions optionsWithToken:self.accessToken
                                                                      block:^(TVIConnectOptionsBuilder * _Nonnull builder) {
        builder.name = @"my-new-room";
    }];
    TVIRoom *room = [TVIVideoClient connectWithOptions:connectOptions delegate:self];
}

#pragma mark - TVIRoomDelegate
func didConnect(to room: TVIRoom) {
    NSLog(@"Did connect to Room");
}
