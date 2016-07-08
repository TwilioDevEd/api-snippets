NSArray<TWMMessage *> *allMessages = [[self.channel messages] allObjects];
for (TWMMessage *message in allMessages) {
    NSLog(@"Message body: %@", message.body);
}
