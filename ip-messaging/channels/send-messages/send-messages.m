TWMMessage *message = [[self.channel messages] createMessageWithBody:@"test"];
[self.channel.messages sendMessage:message completion:^(TWMResult *result) {
    if ([result isSuccessful]) {
        NSLog(@"Message sent.");
    } else {
        NSLog(@"Message NOT sent.");
    }
}];
