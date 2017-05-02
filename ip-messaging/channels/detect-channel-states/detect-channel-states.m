- (void)chatClient:(TwilioChatClient *)client 
      channelAdded:(TCHChannel *)channel {
    NSLog(@"Channel added: %@", channel.friendlyName);
}

- (void)chatClient:(TwilioChatClient *)client 
           channel:(TCHChannel *)channel 
           updated:(TCHChannelUpdate)update {
    NSLog(@"Channel changed: %@", channel.friendlyName);
}

- (void)chatClient:(TwilioChatClient *)client 
      channelDeleted:(TCHChannel *)channel {
    NSLog(@"Channel deleted: %@", channel.friendlyName);
}
