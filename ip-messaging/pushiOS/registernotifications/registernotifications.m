if (self.updatedPushToken) {
    [self.chatClient registerWithToken:self.updatedPushToken];
}

if (self.receivedNotification) {
    [self.chatClient handleNotification:self.receivedNotification];
}
