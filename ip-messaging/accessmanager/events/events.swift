func accessManagerTokenWillExpire(_ accessManager: TwilioAccessManager) {
    // ... obtain new token asynchronously
    accessManager.updateToken(token)
}
