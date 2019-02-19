// Token server endpoint URL
NSString *urlString = @"http://localhost:8000/token.php"

// Make JSON request to server
NSData *jsonResponse = [NSData dataWithContentsOfURL:[NSURL URLWithString:urlString]];
NSError *jsonError;
NSDictionary *tokenResponse = [NSJSONSerialization JSONObjectWithData:jsonResponse
                                                              options:kNilOptions
                                                                error:&jsonError];

// Handle response from server
if (!jsonError) {
  self.identity = tokenResponse[@"identity"];
  NSLog(@"Token found: %@", tokenResponse[@"token"])
} else {
  NSLog(@"error fetching token from server");
}
