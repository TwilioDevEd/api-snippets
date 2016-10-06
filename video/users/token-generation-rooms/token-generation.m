// Token server endpoint URL
NSURL *tokenURL = [NSURL URLWithString:@"http://localhost:8000/token.php"];

NSURLSessionConfiguration *sessionConfig = [NSURLSessionConfiguration defaultSessionConfiguration];
NSURLSession *session = [NSURLSession sessionWithConfiguration:sessionConfig];
NSURLSessionDataTask *task = [session dataTaskWithURL:tokenURL
                                completionHandler: ^(NSData * _Nullable data,
                                                      NSURLResponse * _Nullable response,
                                                      NSError * _Nullable error) {
                                    NSError *err = error;
                                    NSString *accessToken;
                                    NSString *identity;
                                    if (!err) {
                                        if (data != nil) {
                                            NSDictionary *json = [NSJSONSerialization JSONObjectWithData:data
                                                                                                  options:0
                                                                                                    error:&err];
                                            if (!err) {
                                                accessToken = json[@"token"];
                                                identity = json[@"identity"];
                                                NSLog(@"Logged in as %@",identity);
                                            }
                                        }
                                    }
                                    completionHandler(accessToken, err);
                                }];
[task resume];