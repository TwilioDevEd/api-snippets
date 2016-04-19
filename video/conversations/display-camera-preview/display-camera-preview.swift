/* LocalMedia represents our local camera and microphone (media) configuration */
self.localMedia = TWCLocalMedia(delegate: self);
self.camera = self.localMedia?.addCameraTrack();
/* 
We attach a view to display our local camera track immediately.
You could also wait for localMedia:addedVideoTrack to attach a view or add a renderer. 
*/
if((self.camera) != nil && Platform.isSimulator != true) {
    self.camera?.videoTrack?.attach(localVideo)
    self.camera?.videoTrack?.delegate = self;
}