// Create an audio track
var localAudioTrack = TVILocalAudioTrack.init()

// Create a Capturer to provide content for the Track
var camera = TVICameraCapturer()

// Create a video track
var localVideoTrack = TVILocalVideoTrack.init(capturer: camera!)
