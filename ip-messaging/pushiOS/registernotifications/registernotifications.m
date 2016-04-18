if (self.updatedPushToken) {
    [self.ipMessagingClient registerWithToken:self.updatedPushToken];
}

if (self.receivedNotification) {
    [self.ipMessagingClient handleNotification:self.receivedNotification];
}
