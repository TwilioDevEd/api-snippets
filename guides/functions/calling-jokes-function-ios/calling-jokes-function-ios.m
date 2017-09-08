NSString* functionURL = @"https://yourdomain.twil.io/jokes";
NSURL *url = [NSURL URLWithString:functionURL];
NSURLSessionDataTask *task = [[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
    if (error) {
        NSLog(@"Error: %@",error);
    } else {
        NSError *error;
        id responseObject = [NSJSONSerialization JSONObjectWithData:data options:0 error:&error];
        NSLog(@"Response: %@", responseObject);
    }
}];
[task resume];