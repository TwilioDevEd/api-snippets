// Create camera object
TVICameraCapturer *camera = = [[TVICameraCapturer alloc] init];

// Setup the video constraints
TVIVideoConstraints *videoConstraints = [TVIVideoConstraints constraintsWithBlock:
                              ^(TVIVideoConstraintsBuilder * _Nonnull builder) {
    builder.maxSize =TVIVideoConstraintsSize960x540;
    builder.minSize =TVIVideoConstraintsSize960x540;
    builder.maxFrameRate = TVIVideoConstraintsFrameRateNone;
    builder.minFrameRate = TVIVideoConstraintsFrameRateNone;
}];

// Add local video track with camera and video constraints
TVIVideoTrack *localVideoTrack = [TVILocalVideoTrack trackWithCapturer:camera
                                                               enabled:YES
                                                           constraints:videoConstraints];
// If the constraints are not satisfied, a nil track will be returned.
if (localVideoTrack == nil) {
    NSLog(@"Error: Failed to create a video track using the local camera.");
}
