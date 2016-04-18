[self.channel.messages sendMessage:message completion:^(TWMResult result) {
    [textField resignFirstResponder];
    if (result == TWMResultFailure) {
        NSLog(@"message not sent...");
    }
}];