// Create an audio track
TVILocalAudioTrack *localAudioTrack = [TVILocalAudioTrack track];

// Create a capturer to provide content for the track
TVICameraCapturer *camera = = [[TVICameraCapturer alloc] init];

// Create a video track
TVILocalVideoTrack *localVideoTrack = [TVILocalVideoTrack trackWithCapturer:camera];
