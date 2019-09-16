
- (NSString*) createDeviceTokenString:(NSData*) deviceToken {
    const unsigned char *tokenChars = deviceToken.bytes;
    
    NSMutableString *tokenString = [NSMutableString string];
    for (int i=0; i < deviceToken.length; i++) {
        NSString *hex = [NSString stringWithFormat:@"%02x", tokenChars[i]];
        [tokenString appendString:hex];
    }
    return tokenString;
}

-(void) registerDevice:(NSData *) deviceToken identity:(NSString *) identity {
  // Create a POST request to the /register endpoint with device variables to register for Twilio Notifications
    
  NSString *deviceTokenString = [self createDeviceTokenString:deviceToken];


  NSURLSession *session = [NSURLSession sharedSession];

  NSURL *url = [NSURL URLWithString:serverURL];
  NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30.0];
  request.HTTPMethod = @"POST";

  [request addValue:@"application/json" forHTTPHeaderField:@"Accept"];
  [request addValue:@"application/json" forHTTPHeaderField:@"Content-Type"];

  NSDictionary *params = @{@"identity": identity,
                        @"BindingType": @"apn",
                            @"Address": deviceTokenString};

  NSError* err=nil
  NSString *endpoint = [KeychainAccess readEndpoint:identity error:err];
  if (err == nil){
    [params setObject:endpoint forKey:@"endpoint"];
  }

  NSError *error;
  NSData *jsonData = [NSJSONSerialization dataWithJSONObject:params options:0 error:&error];
  request.HTTPBody = jsonData;

  NSURLSessionDataTask *task = [session dataTaskWithRequest:request completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {

    NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"Response: %@", responseString);

    if (error == nil) {
      NSDictionary *response = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
      NSLog(@"JSON: %@", response);

      [KeychainAccess saveEndpoint:identity endpoint:response["endpoint"]]

    } else {
      NSLog(@"Error: %@", error);
    }
  }];
  [task resume];
}
