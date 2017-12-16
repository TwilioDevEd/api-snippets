[[self.client channelsList] publicChannelDescriptorsWithCompletion:^(TCHResult *result, 
  TCHChannelDescriptorPaginator *paginator) {
  if ([result isSuccessful]) {
    for (TCHChannelDescriptor *channel in paginator.items) {
      NSLog(@"Channel: %@", channel.friendlyName);
    }
  }
}];
