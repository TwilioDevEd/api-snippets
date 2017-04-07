- (void)chatClient:(TwilioChatClient *)client channelAdded:(TCHChannel *)channel {
    if(channel.status == TCHChannelStatusInvited) {
        [channel joinWithCompletion:^(TCHResult *result) {
            if ([result isSuccessful]) {
                NSLog(@"Successfully accepted invite.");
            } else {
                NSLog(@"Failed to accept invite.");
            }
        }];
    }
}