- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    if(notificationSettings.types == UIUserNotificationTypeNone) {
        NSLog(@"Failed to get token, error: Notifications are not allowed");
        if (self.ipMessagingClient) {
            [self.ipMessagingClient registerWithToken:nil];
        } else {
            self.updatedPushToken = nil;
        }
    } else {
        [[UIApplication sharedApplication] registerForRemoteNotifications];
    }
}
