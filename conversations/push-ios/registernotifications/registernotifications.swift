if let updatedPushToken = updatedPushToken {
  conversationsClient.register(withNotificationToken: updatedPushToken) { (result) in
    if !result.isSuccessful() {
        // try registration again or verify token
    }
  }
}

if let receivedNotification = receivedNotification {
  conversationsClient.handleNotification(receivedNotification) { (result) in
    if !result.isSuccessful() {
        // Handling of notification was not successful, retry?
    }
  }
}
