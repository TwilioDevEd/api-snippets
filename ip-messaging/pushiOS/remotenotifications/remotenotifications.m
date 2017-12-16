- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken {
    if (self.chatClient && self.chatClient.user) {
        [self.chatClient registerWithNotificationToken:deviceToken
                                            completion:^(TCHResult *result) {
                                                if (![result isSuccessful]) {
                                                    // try registration again or verify token
                                                }
                                            }];
    } else {
        self.updatedPushToken = deviceToken;
    }
}

- (void)application:(UIApplication*)application didFailToRegisterForRemoteNotificationsWithError:(NSError*)error {
    NSLog(@"Failed to get token, error: %@", error);
    self.updatedPushToken = nil;
}
