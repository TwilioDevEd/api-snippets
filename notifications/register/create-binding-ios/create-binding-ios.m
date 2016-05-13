-(void) registerDevice:(NSData *) deviceToken identity:(NSString *) identity {
  // Create a POST request to the /register endpoint with device variables to register for Twilio Notifications
  AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
  NSString * deviceTokenString = [[[[deviceToken description]
                                   stringByReplacingOccurrencesOfString: @"<" withString: @""]
                                   stringByReplacingOccurrencesOfString: @">" withString: @""]
                                   stringByReplacingOccurrencesOfString: @" " withString: @""];
    
  NSDictionary *params = @{@"identity": identity,
                           @"endpoint": [NSString stringWithFormat:@"%@,%@", identity, deviceTokenString],
                        @"BindingType": @"apn",
                            @"Address": deviceTokenString};
    
  manager.responseSerializer = [AFHTTPResponseSerializer serializer];
  [manager.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Accept"];
     
  [manager POST:serverURL parameters:params success:^(AFHTTPRequestOperation *operation, id responseObject) {
    NSLog(@"JSON: %@", responseObject);
  }failure:^(AFHTTPRequestOperation *operation, NSError *error) {
    NSLog(@"Error: %@", error);
  }];
}