- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken {
    if (self.chatClient) {
        [self.chatClient registerWithToken:deviceToken];
    } else {
        self.updatedPushToken = deviceToken;
    }
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error {
    NSLog(@"Failed to get token, error: %@", error);
    if (self.chatClient) {
        [self.chatClient registerWithToken:nil];
    } else {
        self.updatedPushToken = nil;
    }
}
