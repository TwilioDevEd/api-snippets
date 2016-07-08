TWMChannels *channels = [self.client channelsList];
if (channels) {
    for (TWMChannel *channel in channels.allObjects) {
        NSLog(@"Channel: %@", channel.friendlyName);
    }
    
    TWMChannel *channel = [channels channelWithUniqueName:@"general"];
    if (channel) {
        NSLog(@"Channel with unique name: %@", channel.friendlyName);
    }
}
