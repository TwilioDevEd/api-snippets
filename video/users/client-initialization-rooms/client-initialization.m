// Create a Video Client and connect to Twilio's backend.
TVIVideoClient *videoClient = [TVIVideoClient clientWithToken:accessToken];
self.videoClient.delegate = self;

// Join a room 
TVIConnectOptions *connectOptions = [TVIConnectOptions optionsWithBlock:^(TVIConnectOptionsBuilder * _Nonnull builder) {
  builder.name = @"my-room";
}];

TVIRoom *room = [videoClient connectWithOptions:connectOptions delegate:self];