[self.channel destroyWithCompletion:^(TWMResult result) {
    if(result == TWMResultSuccess) {
        NSLog(@"Channel deleted.");
    } else {
        NSLog(@"Channel not deleted.");
    }
}];