// Use TVICameraCapturer to produce video from the device's front camera.
self.camera = [[TVICameraCapturer alloc] init];

// Create a local video track, and render it in the preview view
self.localVideoTrack = [TVILocalVideoTrack trackWithCapturer:self.camera];

if (!self.localVideoTrack) {
    NSLog(@"Failed to add video track");
} else {
    // TVIVideoView is a TVIVideoRenderer and can be added to any TVIVideoTrack.
    self.previewView = [[TVIVideoView alloc] initWithFrame:rect];
    
    // Add renderer to video track for local preview
    [self.localVideoTrack addRenderer:previewView];
    
    self.previewView.mirror = (self.camera.source == TVICameraCaptureSourceFrontCamera);
    
    [self.view addSubview:previewView];
}
