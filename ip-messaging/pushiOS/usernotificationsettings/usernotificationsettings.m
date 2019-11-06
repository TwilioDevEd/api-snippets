// For iOS 10 and later add this to the didFinishLaunchingWithOptions function or a similar place
// once you get granted permissions
if (@available(iOS 10.0, *)) {
    UNUserNotificationCenter *currentNotificationCenter = [UNUserNotificationCenter currentNotificationCenter];
    [currentNotificationCenter getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings *settings) {
        if (settings.authorizationStatus == UNAuthorizationStatusAuthorized) {
            [UIApplication.sharedApplication registerForRemoteNotifications];
        }
    }];
}

// For iOS versions before 10 you should add such implementation
- (void)application:(UIApplication *)application didRegisterUserNotificationSettings:(UIUserNotificationSettings *)notificationSettings {
    if(notificationSettings.types == UIUserNotificationTypeNone) {
        NSLog(@"Failed to get token, error: Notifications are not allowed");
        if (self.chatClient) {
            [self.chatClient registerWithToken:nil];
        } else {
            self.updatedPushToken = nil;
        }
    } else {
        [UIApplication.sharedApplication registerForRemoteNotifications];
    }
}
