/* The CameraCapturer is a default video capturer provided by Twilio which can
capture video from the front or rear-facing device camera  */
var camera = TVICameraCapturer()

/* LocalMedia represents our local camera and microphone (media) configuration
that can be sent to other Participants in Rooms, or previewed locally */
var localMedia = TVILocalMedia()

// Create a local video track, and render it in the preview view
var localVideoTrack = localMedia?.addVideoTrack(true, capturer: camera!)
if (localVideoTrack == nil) {
    logMessage(messageText: "Failed to add video track")
} else {
    // TVIVideoView is a TVIVideoRenderer and can be added to any TVIVideoTrack.
    let previewView = TVIVideoView.init(frame: rect)
    
    // Attach view to video track for local preview
    localVideoTrack!.addRenderer(previewView)
    
    previewView.shouldMirror = (camera!.source == .frontCamera)
    
    self.view.addSubview(previewView)
}
