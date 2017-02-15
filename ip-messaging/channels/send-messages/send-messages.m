TCHMessage *message = [[self.channel messages] createMessageWithBody:@"test"];
[self.channel.messages sendMessage:message completion:^(TCHResult *result) {
    if ([result isSuccessful]) {
        NSLog(@"Message sent.");
    } else {
        NSLog(@"Message NOT sent.");
    }
}];
