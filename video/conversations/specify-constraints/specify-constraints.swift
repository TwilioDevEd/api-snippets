self.localMedia = TWCLocalMedia(delegate: self);

self.camera = self.localMedia?.addCameraTrack();
self.camera?.videoTrack?.attach(localVideo)
self.camera = self.localMedia?.removeMicrophone();
self.camera = self.localMedia?.addMicrophone();
self.outgoingInvite = self.client?.inviteToConversation(self.inviteeIdentity!, localMedia: self.localMedia!, handler: self.acceptHandler());