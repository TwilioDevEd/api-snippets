- (void)ipMessagingClient:(TwilioIPMessagingClient *)client
             channelAdded:(TWMChannel *)channel {
    NSLog(@"Channel added: %@", channel.friendlyName);
}

- (void)ipMessagingClient:(TwilioIPMessagingClient *)client
           channelChanged:(TWMChannel *)channel {
    NSLog(@"Channel changed: %@", channel.friendlyName);
}

- (void)ipMessagingClient:(TwilioIPMessagingClient *)client
           channelDeleted:(TWMChannel *)channel {
    NSLog(@"Channel deleted: %@", channel.friendlyName);
}

- (void)ipMessagingClient:(TwilioIPMessagingClient *)client
     channelHistoryLoaded:(TWMChannel *)channel {
    NSLog(@"Channel history loaded: %@", channel.friendlyName);
}
