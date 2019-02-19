// Use TVICameraCapturer to produce video from the device's front camera.
var camera = TVICameraCapturer()

// Create a local video track, and render it in the preview view
var localVideoTrack = TVILocalVideoTrack.init(capturer: camera!)
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
