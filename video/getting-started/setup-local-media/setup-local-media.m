//Create a local media object
TVILocalMedia *localMedia = [[TVILocalMedia alloc] init];

// Add an audio track
BOOL enable = YES;
TVILocalAudioTrack *localAudioTrack = [localMedia addAudioTrack:enable];

// Create camera object
TVICameraCapturer *camera = = [[TVICameraCapturer alloc] init];

// Add a video track
TVILocalVideoTrack *localVideoTrack = [localMedia addVideoTrack:enable capturer:camera];

// Remove audio track
[localMedia removeAudioTrack:localAudioTrack];

// Remove video track
[localMedia removeVideoTrack:localVideoTrack];
