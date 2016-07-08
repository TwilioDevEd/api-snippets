- (void)ipMessagingClient:(TwilioIPMessagingClient *)client channelAdded:(TWMChannel *)channel {
    if(channel.status == TWMChannelStatusInvited) {
        [channel joinWithCompletion:^(TWMResult *result) {
            if ([result isSuccessful]) {
                NSLog(@"Successfully accepted invite.");
            } else {
                NSLog(@"Failed to accept invite.");
            }
        }];
    }
}
