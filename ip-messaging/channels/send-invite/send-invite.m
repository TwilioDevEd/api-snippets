[self.channel.members inviteByIdentity:@"Juan" completion:^(TCHResult *result) {
    if([result isSuccessful]) {
        NSLog(@"User invited.");
    } else {
        NSLog(@"User NOT invited.");
    }
}];
