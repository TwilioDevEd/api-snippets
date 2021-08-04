let center = UNUserNotificationCenter.current()
center.getNotificationSettings { (settings) in
    if settings.authorizationStatus == .authorized {
        DispatchQueue.main.async {
        UIApplication.shared.registerForRemoteNotifications()
        }
    }
}
