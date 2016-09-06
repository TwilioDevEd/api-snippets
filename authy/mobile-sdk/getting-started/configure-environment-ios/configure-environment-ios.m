AUTError *error = nil;

[self.authy setEnvironment:AUTEnvironmentSTG error: &error];

if (error != nil) {
    NSLog(@"Error %@", [error message]);
}