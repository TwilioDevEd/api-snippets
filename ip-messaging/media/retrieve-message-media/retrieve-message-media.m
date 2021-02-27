if (message.hasMedia) {
    [message getMediaContentTemporaryUrlWithCompletion:^(TCHResult * _Nonnull result,
                                                            NSString * _Nullable mediaContentURL) {
        if (result.isSuccessful) {
            // Use the url to download an image or other media
            NSLog(@"%@", mediaContentURL);
        }
    }];
}