func conversationsClient(conversationsClient: TwilioConversationsClient, didReceiveInvite invite: TWCIncomingInvite) {
    self.localMedia = TWCLocalMedia(delegate: self);
    self.camera = self.localMedia?.addCameraTrack();
 
    invite.acceptWithLocalMedia(self.localMedia, completion: self.acceptHandler());
}
