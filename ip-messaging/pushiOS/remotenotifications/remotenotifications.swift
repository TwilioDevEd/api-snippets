func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
    if let chatClient = chatClient where chatClient.user != nil {
        chatClient.registerWithNotificationToken(deviceToken) { (result) in
          if (!result.isSuccessful()) {
            // try registration again or verify token
          }
        }
    } else {
        updatedPushToken = deviceToken
    }
}

func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
    NSLog("Failed to get token, error: %@", error)
    updatedPushToken = nil
}
