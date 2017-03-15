- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
    if(application.applicationState != UIApplicationStateActive) { // Only address notifications received when not active
        // If your application supports multiple types of push notifications, you may wish to limit which ones you send to the TwilioChatClient here
            if (self.chatClient && userInfo) {
                // If your reference to the Chat client exists and is initialized, send the notification to it
                [self.chatClient handleNotification:userInfo];
            } else {
                // Store the notification for later handling
                self.receivedNotification = userInfo;
            }
    }
}