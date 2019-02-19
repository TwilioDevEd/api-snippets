func application(application: UIApplication, didRegisterUserNotificationSettings notificationSettings: UIUserNotificationSettings) {
    if notificationSettings.types == .None {
        NSLog("Failed to get token, error: Notifications are not allowed")
        if let chatClient = chatClient where chatClient.userInfo != nil {
            chatClient.registerWithToken(nil)
        } else {
            updatedPushToken = nil
        }
    }
    else {
        UIApplication.sharedApplication().registerForRemoteNotifications()
    }
}
