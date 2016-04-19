[self.channelsList createChannelWithFriendlyName:@"test_name" type:TWMChannelTypePublic completion:^(TWMResult result, TWMChannel *channel) {
    if(result == TWMResultSuccess) {
        NSLog(@"Channel created.");
    } else {
        NSLog(@"Channel not created.");
    }
}];