/* The CameraCapturer is a default video capturer provided by Twilio which can
capture video from the front or rear-facing device camera  */
@property (nonatomic, strong) TVICameraCapturer *camera;

TVIVideoView *previewView = [[TVIVideoView alloc] initWithFrame:rect];

/* LocalMedia represents our local camera and microphone (media) configuration
that can be sent to other Participants in Rooms, or previewed locally */
@property (nonatomic, strong) TVILocalMedia *localMedia;

// Create a local video track, and render it in the preview view
self.localMedia = [[TVILocalMedia alloc] init];

self.camera = [[TVICameraCapturer alloc] init];

self.localVideoTrack = [self.localMedia addVideoTrack:YES capturer:self.camera];
if (!self.localVideoTrack) {
	NSLog(@"Failed to add video track");
} else {
    [self.view addSubview:previewView];
    
	// Addd renderer to video track for local preview
	[self.localVideoTrack addRenderer:previewView];
}
