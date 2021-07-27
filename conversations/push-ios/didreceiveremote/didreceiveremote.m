// Do not forget to set up a delegate for UNUserNotificationCenter
- (void)userNotificationCenter:(UNUserNotificationCenter *)center
didReceiveNotificationResponse:(UNNotificationResponse *)response
         withCompletionHandler:(void (^)(void))completionHandler {
    NSDictionary *userInfo = response.notification.request.content.userInfo;
    // If your application supports multiple types of push notifications, 
    // you may wish to limit which ones you send to the TwilioConversationsClient here
    if (self.conversationsClient) {
        // If your reference to the Conversations client exists and is initialized, 
        // send the notification to it
        [self.conversationsClient handleNotification:userInfo completion:^(TCHResult *result) {
            if (![result isSuccessful]) {
                // Handling of notification was not successful, retry?
            }
        }];
    } else {
         // Store the notification for later handling
         self.receivedNotification = userInfo;
     }
}
