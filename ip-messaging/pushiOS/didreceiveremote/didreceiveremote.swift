func application(application: UIApplication, didReceiveRemoteNotification userInfo: [NSObject : AnyObject]) {
    if application.applicationState != .Active { // Only address notifications received when not active
        // If your application supports multiple types of push notifications, you may wish to limit which ones you send to the TwilioChatClient here
        if let chatClient = chatClient where chatClient.userInfo != nil {
            // If your reference to the Chat client exists and is initialized, send the notification to it
            chatClient.handleNotification(userInfo)
        } else {
            // Store the notification for later handling
            receivedNotification = userInfo
        }
    }
}
