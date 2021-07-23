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
