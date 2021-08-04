if (self.updatedPushToken) {
    [self.conversationsClient registerWithNotificationToken:self.updatedPushToken
                                                 completion:^(TCHResult *result) {
        if (![result isSuccessful]) {
            // try registration again or verify token
        }
    }];
}

if (self.receivedNotification) {
    [self.conversationsClient handleNotification:self.receivedNotification
                                      completion:^(TCHResult *result) {
        if (![result isSuccessful]) {
            // Handling of notification was not successful, retry?
        }
    }];
}
