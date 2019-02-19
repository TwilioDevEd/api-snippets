// Initialize Chat Client
NSString *identifierForVendor = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
NSString *tokenEndpoint = @"http://localhost:8000/token.php?device=%@";
NSString *urlString = [NSString stringWithFormat:tokenEndpoint, identifierForVendor];

// Make JSON request to server
NSURL *url = [NSURL URLWithString:urlString];
NSURLSession *session = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
NSURLSessionDataTask *dataTask = [session dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
  if (data) {
    NSError *jsonError;
    NSDictionary *tokenResponse = [NSJSONSerialization JSONObjectWithData:data
                                                                  options:kNilOptions
                                                                    error:&jsonError];
    // Handle response from server
    if (!jsonError) {
      self.identity = tokenResponse[@"identity"];
      self.token = tokenResponse[@"token"]  
    } else {
      NSLog(@"error parsing token from server");
    }
  } else {
    NSLog(@"error fetching token from server");
  }
}];
[dataTask resume];
