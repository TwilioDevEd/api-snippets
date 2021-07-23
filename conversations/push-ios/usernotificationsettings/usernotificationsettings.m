// Add this to the didFinishLaunchingWithOptions function or a similar place
// once you get granted permissions
UNUserNotificationCenter *currentNotificationCenter = [UNUserNotificationCenter currentNotificationCenter];
[currentNotificationCenter getNotificationSettingsWithCompletionHandler:^(UNNotificationSettings *settings) {
    if (settings.authorizationStatus == UNAuthorizationStatusAuthorized) {
        [UIApplication.sharedApplication registerForRemoteNotifications];
    }
}];
