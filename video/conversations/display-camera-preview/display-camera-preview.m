/* The CameraCapturer is a default video capturer provided by Twilio which can
capture video from the front or rear-facing device camera */
@property (nonatomic, strong) TWCCameraCapturer *camera;
// Video Tracks (local or remote) can be attached to any UIView
@property (weak, nonatomic) IBOutlet UIView *localVideoContainer;

/* LocalMedia represents our local camera and microphone (media) configuration
that can be sent to other Conversation Participants, or previewed locally */
TWCLocalMedia *localMedia = [[TWCLocalMedia alloc] initWithDelegate:self];
#if !TARGET_IPHONE_SIMULATOR
	// On the simulator, there is no camera available. Microphone is enabled by default.
	self.camera = [self.localMedia addCameraTrack];
#else

// We can attach our local camera Video Track to a UIView immediately
if (self.camera) {
	[self.camera.videoTrack attach:self.localVideoContainer];
	self.camera.videoTrack.delegate = self;
}