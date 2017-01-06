NSArray<TCHMessage *> *allMessages = [[self.channel messages] allObjects];
for (TCHMessage *message in allMessages) {
    NSLog(@"Message body: %@", message.body);
}
