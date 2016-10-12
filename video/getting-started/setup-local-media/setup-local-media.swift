// Create a local media object
var localMedia = TVILocalMedia()

// Add an audio track
var enable = true;
var localAudioTrack = localMedia.addAudioTrack(enable)

// Create camera object
var camera = TVICameraCapturer()

// Add a video track
var localVideoTrack = localMedia.addVideoTrack(enable, capturer: camera)

// Remove audio track
localMedia.removeAudioTrack(localAudioTrack?)

// Remove video track
localMedia.removeVideoTrack(localVideoTrack?)
