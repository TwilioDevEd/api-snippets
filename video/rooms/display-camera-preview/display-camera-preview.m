// Create a local video track, and render it in the preview view
self.localMedia = [[TVILocalMedia alloc] init];

self.camera = [[TVICameraCapturer alloc] init];

self.localVideoTrack = [self.localMedia addVideoTrack:YES capturer:self.camera];

if (!self.localVideoTrack) {
    NSLog(@"Failed to add video track");
} else {
    self.previewView = [[TVIVideoView alloc] initWithFrame:rect];
    
    // Add renderer to video track for local preview
    [self.localVideoTrack addRenderer:previewView];
    
    [self.view addSubview:previewView];
}
