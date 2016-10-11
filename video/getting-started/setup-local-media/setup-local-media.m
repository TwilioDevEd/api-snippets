//Create a local media object
TVILocalMedia *localMedia = [[TVILocalMedia alloc] init];

// Add an audio track
BOOL enable = YES;
TVILocalAudioTrack *localAudioTrack = [localMedia addAudioTrack:enable];

// Create camera object
TVICameraCapturer *camera = = [[TVICameraCapturer alloc] init];

// Connect and share your local media
TVIRoom *room = [videoClient connectWithOptions:connectOptions delegate:self];

// Remove audio track
[localMedia removeAudioTrack:localAudioTrack]

// Remove video track
[localMedia removeVideoTrack:localVideoTrack]
