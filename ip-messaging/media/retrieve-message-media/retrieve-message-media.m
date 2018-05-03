// Set up output stream for media content
NSString *tempFilename = [NSTemporaryDirectory() stringByAppendingPathComponent:message.mediaFilename ? @"file.dat" : message.mediaFilename];
NSOutputStream *outputStream = [NSOutputStream outputStreamToFileAtPath:tempFilename append:NO];

// Request the start of the download
[message getMediaWithOutputStream:outputStream
                        onStarted:^{
                            // Called when download of media begins.
                        } onProgress:^(NSUInteger bytes) {
                            // Called as download progresses, with the current byte count.
                        } onCompleted:^(NSString * _Nonnull mediaSid) {
                            // Called when download is completed, with the new mediaSid if successful.
                            // Full failure details will be provided through the completion block below.
                        } completion:^(TCHResult * _Nonnull result) {
                            if (!result.isSuccessful) {
                                NSLog(@"Download failed: %@", result.error);
                            } else {
                                NSLog(@"Download successful");
                            }
                        }]; 
