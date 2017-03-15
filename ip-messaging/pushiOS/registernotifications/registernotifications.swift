if let updatedPushToken = updatedPushToken {
    chatClient.registerWithToken(updatedPushToken)
}

if let receivedNotification = receivedNotification {
    chatClient.handleNotification(receivedNotification)
}
