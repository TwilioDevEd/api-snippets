// Create camera object
let camera = TVICameraCapturer()

// Setup the video constraints
let videoConstraints = TVIVideoConstraints { (constraints) in
    constraints.maxSize = TVIVideoConstraintsSize960x540;
    constraints.minSize = TVIVideoConstraintsSize960x540;
    constraints.maxFrameRate = TVIVideoConstraintsFrameRateNone;
    constraints.minFrameRate = TVIVideoConstraintsFrameRateNone;
}

// Add local video track with camera and video constraints
var localVideoTrack = TVILocalVideoTrack.init(capturer: camera!,
                                              enabled: true,
                                              constraints: videoConstraints)
// If the constraints are not satisfied, a nil track will be returned.
if (localVideoTrack == nil) {
    print ("Error: Failed to create a video track using the local camera.")
}
