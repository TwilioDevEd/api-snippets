/* The CameraCapturer is a default video capturer provided by Twilio which can
capture video from the front or rear-facing device camera  */
var camera = TVICameraCapturer()

// TVIVideoView (local or remote) can be added as renderer on TVIVideoTrack
let previewView = TVIVideoView.init(frame: rect)

/* LocalMedia represents our local camera and microphone (media) configuration
that can be sent to other Participants in Rooms, or previewed locally */
var localMedia = TVILocalMedia()

// Create a local video track, and render it in the preview view
var localVideoTrack = localMedia?.addVideoTrack(true, capturer: camera!)
if (localVideoTrack == nil) {
    logMessage(messageText: "Failed to add video track")
} else {
    self.view.addSubview(previewView)

    // Attach view to video track for local preview
    localVideoTrack!.addRenderer(previewView)
}
