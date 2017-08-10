[channelDescriptor channelWithCompletion:^(TCHResult *result, TCHChannel *channel) {
  if([result isSuccessful]) {
    NSLog(@"ChannelStatus: %@", channel.status);
  }
}]
