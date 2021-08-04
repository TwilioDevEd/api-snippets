- (void)application:(UIApplication*)application didRegisterForRemoteNotificationsWithDeviceToken:(NSData*)deviceToken {
    if (self.conversationsClient && self.conversationsClient.user) {
        [self.conversationsClient registerWithNotificationToken:deviceToken
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
