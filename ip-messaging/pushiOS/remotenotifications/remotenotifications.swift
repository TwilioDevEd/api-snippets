func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
    if let chatClient = chatClient where chatClient.userInfo != nil {
        chatClient.registerWithToken(deviceToken)
    } else {
        updatedPushToken = deviceToken
    }
}

func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
    NSLog("Failed to get token, error: %@", error)
    if let chatClient = chatClient where chatClient.userInfo != nil {
        chatClient.registerWithToken(nil)
    } else {
        updatedPushToken = nil
    }
}
