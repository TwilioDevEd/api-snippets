AUTError *currentError = nil;

BOOL isDeviceRegistered = [self.authy isDeviceRegistered:&currentError];

if  (currentError != nil) {
    NSLog(@"Error %@", [currentError message]);
}