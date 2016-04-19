NSError *error = nil;
BOOL didInvite = [self.conversation invite:@"Charles" error:&error];
if(didInvite) {
    NSLog(@"Invited!");
} else {
    NSLog(@"Not invited :(");
}