// See the "Create a Conversation" guide for details of the acceptHandler
...
outgoingInvite = self.client?.inviteToConversation("alice", 
												   localMedia: self.setupLocalMedia(),
												   handler: self.acceptHandler)
...


func setupLocalMedia() -> TWCLocalMedia {
    // Create LocalMedia with a camera track and no microphone track
    var localMedia = TWCLocalMedia(delegate: self)
    localMedia!.addCameraTrack()
    return localMedia!
}


// MARK: TWCLocalMediaDelegate
extension ViewController: TWCLocalMediaDelegate {
  func localMedia(media: TWCLocalMedia, didAddVideoTrack videoTrack: TWCVideoTrack) {
    videoTrack.attach(self.localMediaView)
  }
}