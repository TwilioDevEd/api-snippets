- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken {
    if (self.ipMessagingClient) {
        [self.ipMessagingClient registerWithToken:deviceToken];
    } else {
        self.updatedPushToken = deviceToken;
    }
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error {
    NSLog(@"Failed to get token, error: %@", error);
    if (self.ipMessagingClient) {
        [self.ipMessagingClient registerWithToken:nil];
    } else {
        self.updatedPushToken = nil;
    }
}
