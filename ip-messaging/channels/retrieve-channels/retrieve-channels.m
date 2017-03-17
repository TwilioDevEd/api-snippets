[[self.client channelsList] userChannelsWithCompletion:^(TCHResult *result, 
  TCHChannelPaginator *paginator) {
  if ([result isSuccessful]) {
    for (TCHChannel *channel in paginator.items) {
      NSLog(@"Channel: %@", channel.friendlyName);
    }
  }
}];