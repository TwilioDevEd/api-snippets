// If you want us to handle push notifications you should let us know when 
// the push token changed in the device
[sharedTwilioAuth setPushToken:deviceTokenAsString completion:^(NSError * _Nullable error) {

    if (!error) {
        // Push token configured successfully
    }

}];
