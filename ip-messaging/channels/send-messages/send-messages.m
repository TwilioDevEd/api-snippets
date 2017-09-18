TCHMessageOptions *options = [[TCHMessageOptions new] withBody:@"test"];
[self.channel.messages sendMessageWithOptions:options completion:^(TCHResult *result, TCHMessage *message) {
    if ([result isSuccessful]) {
        NSLog(@"Message sent.");
    } else {
        NSLog(@"Message NOT sent.");
    }
}];
