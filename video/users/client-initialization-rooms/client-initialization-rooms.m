// Join a room 
TVIConnectOptions *connectOptions = [TVIConnectOptions optionsWithToken:self.accessToken
                                                                  block:^(TVIConnectOptionsBuilder * _Nonnull builder) {
  builder.roomName = @"my-room";
}];

TVIRoom *room = [TwilioVideo connectWithOptions:connectOptions delegate:self];
