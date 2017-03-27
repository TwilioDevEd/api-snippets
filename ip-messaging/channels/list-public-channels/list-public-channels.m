[[self.client channelsList] publicChannelsWithCompletion:^(TCHResult *result, 
  TCHChannelDescriptorPaginator *paginator) {
  if ([result isSuccessful]) {
    for (TCHChannelDescriptor *channel in paginator.items) {
      NSLog(@"Channel: %@", channel.friendlyName);
    }
  }
}];
