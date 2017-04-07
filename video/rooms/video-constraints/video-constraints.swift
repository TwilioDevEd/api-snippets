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
var localVideoTrack:TVILocalVideoTrack?
do {
    localVideoTrack = try localMedia?.addVideoTrack(true, capturer: camera, constraints: videoConstraints)
} catch let error as NSError {
    print ("Error: Failed to create a video track using the local camera. error = \(error)")
    localVideoTrack = nil
}
