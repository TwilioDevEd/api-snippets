if let updatedPushToken = updatedPushToken {
  chatClient.register(withNotificationToken: updatedPushToken) { (result) in
    if (!result.isSuccessful()) {
        // try registration again or verify token
    }
  }
}

if let receivedNotification = receivedNotification {
  chatClient.handleNotification(receivedNotification) { (result) in
    if (!result.isSuccessful()) {
        // Handling of notification was not successful, retry?
    }
  }
}
