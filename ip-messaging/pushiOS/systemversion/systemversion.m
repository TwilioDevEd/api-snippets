if (@available(iOS 10.0, *)) {
    UNUserNotificationCenter *currentNotificationCenter = [UNUserNotificationCenter currentNotificationCenter];
    [currentCenter requestAuthorizationWithOptions:UNAuthorizationOptionBadge | UNAuthorizationOptionAlert | UNAuthorizationOptionSound
                                 completionHandler:^(BOOL granted, NSError *error) {
        // Add here your handling of granted or not granted permissions
    }];
    currentNotificationCenter.delegate = self;
} else {
    NSDictionary* localNotification = [launchOptions objectForKey:UIApplicationLaunchOptionsRemoteNotificationKey];
    if (localNotification) {
        [self application:application didReceiveRemoteNotification:localNotification];
    }

    [UIApplication.sharedApplication registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
    [UIApplication.sharedApplication registerForRemoteNotifications];
}
