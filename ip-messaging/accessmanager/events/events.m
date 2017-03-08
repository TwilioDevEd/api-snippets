- (void)accessManagerTokenWillExpire:(nonnull TwilioAccessManager *)accessManager {
    // ... obtain new token asynchronously
    [accessManager updateToken:token];
}
