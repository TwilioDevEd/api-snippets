func application(application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: NSData) {
    if let ipMessagingClient = ipMessagingClient where ipMessagingClient.userInfo != nil {
        ipMessagingClient.registerWithToken(deviceToken)
    } else {
        updatedPushToken = deviceToken
    }
}

func application(application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: NSError) {
    NSLog("Failed to get token, error: %@", error)
    if let ipMessagingClient = ipMessagingClient where ipMessagingClient.userInfo != nil {
        ipMessagingClient.registerWithToken(nil)
    } else {
        updatedPushToken = nil
    }
}
