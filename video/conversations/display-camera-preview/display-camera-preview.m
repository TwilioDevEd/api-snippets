/* LocalMedia represents our local camera and microphone (media) configuration */
self.localMedia = [[TWCLocalMedia alloc] initWithDelegate:self];
self.camera = [self.localMedia addCameraTrack];
/* 
We attach a view to display our local camera track immediately.
You could also wait for localMedia:addedVideoTrack to attach a view or add a renderer. 
*/
if (self.camera) {
    [self.camera.videoTrack attach:self.localVideoContainer];
    self.camera.videoTrack.delegate = self;
}