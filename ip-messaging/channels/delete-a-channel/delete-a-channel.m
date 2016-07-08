[self.channel destroyWithCompletion:^(TWMResult *result) {
    if([result isSuccessful]) {
        NSLog(@"Channel destroyed.");
    } else {
        NSLog(@"Channel NOT destroyed.");
    }
}];
