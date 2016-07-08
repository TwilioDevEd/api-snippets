- (void)ipMessagingClient:(TwilioIPMessagingClient *)client channel:(TWMChannel *)channel messageAdded:(TWMMessage *)message {
    NSLog(@"%@ said: %@", message.author, message.body);
}
