[self.client channelsListWithCompletion:^(TWMResult result, TWMChannels *channelsList) {
    self.channel = [channelsList channelWithUniqueName:@"general"];
    [self.channel joinWithCompletion:^(TWMResult result) {
        NSLog(@"joined general channel");
    }];
}];