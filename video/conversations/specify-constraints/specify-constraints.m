self.localMedia = [[TWCLocalMedia alloc] initWithDelegate:self];
// Example constraints
[self.localMedia addCameraTrack];
[self.localMedia removeTrack:self.videoTrack];
[self.localMedia removeMicrophone];
[self.localMedia addMicrophone];
self.outgoingInvite = [self.client inviteToConversation:self.inviteeIdentity
                                             localMedia:self.localMedia
                                                handler:[self acceptHandler]];
