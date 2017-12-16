NSArray<TCHChannel *> *channels = [[self.client channelsList] subscribedChannels];
for (TCHChannel *channel in channels) {
  NSLog(@"Channel: %@", channel.friendlyName);
}
