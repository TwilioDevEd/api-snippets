// For iOS 10 and later; do not forget to set up a delegate for UNUserNotificationCenter
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
didReceiveNotificationResponse:(UNNotificationResponse *)response
         withCompletionHandler:(void (^)(void))completionHandler {
    NSDictionary *userInfo = response.notification.request.content.userInfo;
    // If your application supports multiple types of push notifications, you may wish to limit which ones you send to the TwilioChatClient here
    if (self.chatClient) {
        // If your reference to the Chat client exists and is initialized, send the notification to it
        [self.chantClient handleNotification:userInfo completion:^(TCHResult *result) {
            if (![result isSuccessful]) {
                // Handling of notification was not successful, retry?
            }
        }];
    } else {
         // Store the notification for later handling
         self.receivedNotification = userInfo;
     }
}

// For iOS versions before 10
- (void)application:(UIApplication *)application didReceiveRemoteNotification:(NSDictionary *)userInfo {
  // If your application supports multiple types of push notifications, you may wish to limit which ones you send to the TwilioChatClient here
  if (self.chatClient && userInfo) {
      // If your reference to the Chat client exists and is initialized, send the notification to it
      [self.chatClient handleNotification:userInfo completion:^(TCHResult *result) {
        if (![result isSuccessful]) {
          // Handling of notification was not successful, retry?
        }
      }];
  } else {
      // Store the notification for later handling
      self.receivedNotification = userInfo;
  }
}
