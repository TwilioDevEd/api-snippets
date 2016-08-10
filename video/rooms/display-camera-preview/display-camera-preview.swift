/* The CameraCapturer is a default video capturer provided by Twilio which can
capture video from the front or rear-facing device camera  */
var camera: TWCCameraCapturer? 
// Video Tracks (local or remote) can be attached to any UIView 
@IBOutlet weak var localVideoContainer: UIView!

/* LocalMedia represents our local camera and microphone (media) configuration
that can be sent to other Conversation Participants, or previewed locally */
self.localMedia = TWCLocalMedia(delegate: self)
if (!Platform.isSimulator) {
	self.camera = self.localMedia?.addCameraTrack()
}

// We can attach our local camera Video Track to a UIView immediately
if(self.camera != nil) {
  self.camera?.videoTrack?.attach(self.localMediaView)
  self.camera?.videoTrack?.delegate = self
}