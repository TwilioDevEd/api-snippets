let center = UNUserNotificationCenter.current()
center.requestAuthorization(options: [.alert, .badge, .sound]) {
  (granted, error) in
  print("User allowed notifications:", granted)
  if granted {
    DispatchQueue.main.async {
      UIApplication.shared.registerForRemoteNotifications()
    }
  }
}