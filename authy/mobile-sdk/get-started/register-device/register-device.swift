// You should obtain the registration token from your backend
// `pushToken` is optional, you should include it if you want us to handle push notifications
// the push token is obtained when registering your app for push notifications.
sharedTwilioAuth.registerDevice(withRegistrationToken: registrationToken pushToken: pushToken) { error in
    // ...
}