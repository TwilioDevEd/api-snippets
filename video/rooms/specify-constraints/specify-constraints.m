// See the "Create a Conversation" guide for details of the acceptHandler
...
outgoingInvite = [self.client inviteToConversation:@"alice"
										localMedia:[self setupLocalMedia]
										   handler:[self acceptHandler]];
...

- (TWCLocalMedia *)setupLocalMedia
{
	// Create LocalMedia with a camera track and no microphone track
	TWCLocalMedia *localMedia = [[TWCLocalMedia alloc] initWithDelegate:self];
	[localMedia addCameraTrack];
	return localMedia;
}


#pragma mark - TWCLocalMediaDelegate

- (void)localMedia:(TWCLocalMedia *)media didAddVideoTrack:(TWCVideoTrack *)videoTrack
{
	// Display Local Video track on screen
	[videoTrack attach:self.localVideoContainer];
}