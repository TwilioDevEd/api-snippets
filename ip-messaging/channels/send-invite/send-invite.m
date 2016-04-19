[self.channel.members inviteByIdentity:@"Juan" completion:^(TWMResult result) {
    if(result == TWMResultSuccess) {
        NSLog(@"Member Invited.");
    } else {
        NSLog(@"Member not Invited.");
    }
}];
