NSError *error = nil;
BOOL didInvite = [self.conversation inviteMany:@[@"Charles", @"Dena"] error:&error];
if(didInvite) {
    NSLog(@"Invited!");
} else {
    NSLog(@"Not invited.");
}