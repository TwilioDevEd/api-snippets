if let updatedPushToken = updatedPushToken {
    ipMessagingClient.registerWithToken(updatedPushToken)
}

if let receivedNotification = receivedNotification {
    ipMessagingClient.handleNotification(receivedNotification)
}
