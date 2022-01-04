// The data for the image you would like to send
NSData *data = nil;

// Prepare the message
TCHMessageBuilder *messageBuilder = [self.conversation prepareMessage];

TCHMediaListener *mediaListener = [[TCHMediaListener alloc] initWithOnStarted:^{
    // Called when upload of media begins.
    NSLog(@"Media upload started");
} onProgress^(NSUInteger bytes) {
    // Called as upload progresses, with the current byte count.
    NSLog(@"Media upload progress: %ld", bytes);
} onCompleted:^(NSString * _Nonnull mediaSid) {
    // Called when upload is completed, with the new mediaSid if successful.
    NSLog(@"Media upload completed");
} onError:^(TCHError *error) {
    // Error details in case upload has failed.
    NSLog(@"Media upload failed with error: %@", error);
}];

[messageBuilder addMediaWithData:data contentType:@"image/jpeg" filename:@"image.jpg" listener:mediaListener];

// Trigger the sending of the message.
[messageBuilder buildAndSendWithCompletion:^(TCHResult *result, TCHMessage *message) {
    if (!result.isSuccessful) {
       NSLog(@"Creation failed: %@", result.error);
    } else {
       NSLog(@"Creation successful");
    }
}];
