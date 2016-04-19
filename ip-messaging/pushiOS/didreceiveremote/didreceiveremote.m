- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    if(application.applicationState != UIApplicationStateActive) { // Only address notifications received when not active
        // If your application supports multiple types of push notifications, you may wish to limit which ones you send to the TwilioIPMessagingClient here
            if (self.ipMessagingClient && userInfo) {
                // If your reference to the IP Messaging client exists and is initialized, send the notification to it
                [self.ipMessagingClient handleNotification:userInfo];
            } else {
                // Store the notification for later handling
                self.receivedNotification = userInfo;
            }
    }
}