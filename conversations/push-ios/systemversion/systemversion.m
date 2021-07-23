UNUserNotificationCenter *currentNotificationCenter = [UNUserNotificationCenter currentNotificationCenter];
[currentCenter requestAuthorizationWithOptions:UNAuthorizationOptionBadge | UNAuthorizationOptionAlert | UNAuthorizationOptionSound
                                completionHandler:^(BOOL granted, NSError *error) {
    // Add here your handling of granted or not granted permissions
}];
currentNotificationCenter.delegate = self;
