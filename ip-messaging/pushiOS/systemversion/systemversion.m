if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0) {
       [[UIApplication sharedApplication] registerUserNotificationSettings:[UIUserNotificationSettings settingsForTypes:(UIUserNotificationTypeSound | UIUserNotificationTypeAlert | UIUserNotificationTypeBadge) categories:nil]];
} else {
       [[UIApplication sharedApplication] registerForRemoteNotificationTypes:
        (UIUserNotificationTypeBadge | UIUserNotificationTypeSound | UIUserNotificationTypeAlert)];
}