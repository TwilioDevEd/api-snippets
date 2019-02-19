[self.channel destroyWithCompletion:^(TCHResult *result) {
    if([result isSuccessful]) {
        NSLog(@"Channel destroyed.");
    } else {
        NSLog(@"Channel NOT destroyed.");
    }
}];
