func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
    print("Received device token")
    if let conversationsClient = conversationsClient, conversationsClient.user != nil {
        conversationsClient.register(withNotificationToken: deviceToken) { (result) in
            if !result.isSuccessful() {
                // try registration again or verify token
            }
        }
    } else {
        updatedPushToken = deviceToken
    }
}

func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
    print("Failed to get token, error: %@", error)
    updatedPushToken = nil
}
