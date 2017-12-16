- (void) chatClient:(TwilioChatClient *)client channel:(TCHChannel *)channel 
    messageAdded:(TCHMessage *)message {
    
  NSLog(@"%@ said: %@", message.author, message.body);
}
