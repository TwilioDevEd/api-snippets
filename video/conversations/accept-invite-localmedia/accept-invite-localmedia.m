- (void)conversationsClient:(TwilioConversationsClient *)conversationsClient 
           didReceiveInvite:(TWCIncomingInvite *)invite {

    self.localMedia = [[TWCLocalMedia alloc] initWithDelegate:self];
    self.camera = [self.localMedia addCameraTrack];

    [invite acceptWithLocalMedia:self.localMedia
                      completion:[self acceptHandler]];
}