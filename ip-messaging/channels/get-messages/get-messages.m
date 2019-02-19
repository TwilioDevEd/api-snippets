[self.channel.messages getLastMessagesWithCount:100 
  completion:^(TCHResult *result, NSArray<TCHMessage *> *messages) {
  for (TCHMessage *message in messages) {
    NSLog(@"Message body: %@", message.body);
  }
}];
