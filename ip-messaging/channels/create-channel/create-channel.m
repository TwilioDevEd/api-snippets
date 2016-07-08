// Where "client" is an authenticated client obtained with
// [TwilioIPMessagingClient ipMessagingClientWithAccessManager:properties:delegate:]
// and the callback for ipMessagingClient:synchronizationStatusChanged: has been called with .ChannelsListCompleted
// Create the general channel (for public use) if it hasn't been created yet
TWMChannels *channels = [self.client channelsList];
NSDictionary *options = @{
                          TWMChannelOptionFriendlyName: @"General Channel",
                          TWMChannelOptionUniqueName: @"general",
                          TWMChannelOptionType: @(TWMChannelTypePublic)
                          };
[channels createChannelWithOptions:options completion:^(TWMResult *result, TWMChannel *channel) {
    if([result isSuccessful]) {
        NSLog(@"Channel created.");
    } else {
        NSLog(@"Channel NOT created.");
    }
}];
