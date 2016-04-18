- (void)ipMessagingClient:(TwilioIPMessagingClient *)client channelAdded:(TWMChannel *)channel {
    if(channel.status == TWMChannelStatusInvited) {
        [channel joinWithCompletion:^(TWMResult *result) {
            NSLog(@"Invite accepted.");
        }];
    }
}