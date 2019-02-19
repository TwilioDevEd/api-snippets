// Where "client" is an authenticated client obtained with
// [TwilioChatClient chatClientWithToken:properties:delegate:]
// and the callback for chatClient:synchronizationStatusChanged: has been called with TCHClientSynchronizationStatusChannelsListCompleted
TCHChannel *channel = [[self.client channelsList] channelWithUniqueName:@"general"];
if (channel) {
    [channel joinWithCompletion:^(TCHResult *result) {
        if ([result isSuccessful]) {
            NSLog(@"Channel joined.");
        } else {
            NSLog(@"Channel NOT joined.");
        }
    }];
}
