// The data for the image you would like to send
NSData *data = nil;

// Prepare the upload stream and parameters
TCHMessageOptions *messageOptions = [[TCHMessageOptions alloc] init];
NSInputStream *inputStream = [NSInputStream inputStreamWithData:data];
[messageOptions withMediaStream:inputStream
                    contentType:@"image/jpeg"
                defaultFilename:@"image.jpg"
                      onStarted:^{
                          // Called when upload of media begins.
                          NSLog(@"Media upload started");
                      } onProgress:^(NSUInteger bytes) {
                          // Called as upload progresses, with the current byte count.
                          NSLog(@"Media upload progress: %ld", bytes);
                      } onCompleted:^(NSString * _Nonnull mediaSid) {
                          // Called when upload is completed, with the new mediaSid if successful.
                          // Full failure details will be provided through sendMessage's completion.
                          NSLog(@"Media upload completed");
                      }];

// Trigger the sending of the message.
[self.channel.messages sendMessageWithOptions:messageOptions
                                   completion:^(TCHResult *result, TCHMessage *message) {
                                       if (!result.isSuccessful) {
                                           NSLog(@"Creation failed: %@", result.error);
                                       } else {
                                           NSLog(@"Creation successful");
                                       }
                                   }]; 
