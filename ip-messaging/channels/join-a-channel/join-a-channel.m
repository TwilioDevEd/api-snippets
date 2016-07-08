// Where "client" is an authenticated client obtained with
// [TwilioIPMessagingClient ipMessagingClientWithAccessManager:properties:delegate:]
// and the callback for ipMessagingClient:synchronizationStatusChanged: has been called with TWMClientSynchronizationStatusChannelsListCompleted
TWMChannel *channel = [[self.client channelsList] channelWithUniqueName:@"general"];
if (channel) {
    [channel joinWithCompletion:^(TWMResult *result) {
        if ([result isSuccessful]) {
            NSLog(@"Channel joined.");
        } else {
            NSLog(@"Channel NOT joined.");
        }
    }];
}
