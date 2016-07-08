[self.channel.members inviteByIdentity:@"Juan" completion:^(TWMResult *result) {
    if([result isSuccessful]) {
        NSLog(@"User invited.");
    } else {
        NSLog(@"User NOT invited.");
    }
}];
