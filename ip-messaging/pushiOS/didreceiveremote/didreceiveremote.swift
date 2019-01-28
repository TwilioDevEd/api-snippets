func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable : Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
    // If your application supports multiple types of push notifications, you may wish to limit which ones you send to the TwilioChatClient here
    if let chatClient = chatClient, chatClient.user != nil {
        // If your reference to the Chat client exists and is initialized, send the notification to it
        chatClient.handleNotification(userInfo) { (result) in
            if (!result.isSuccessful()) {
                // Handling of notification was not successful, retry?
            }
        }
    } else {
        // Store the notification for later handling
        receivedNotification = userInfo
    }
}
