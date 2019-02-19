- (void)viewDidLoad
{
    NSURL *url = [NSURL URLWithString:@"https://your.server.name/token"];
    NSError *error = nil;
    NSString *token = [NSString stringWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    if (token == nil) {
        NSLog(@"Error retrieving token: %@", [error localizedDescription]);
    } else {
        // TODO: use token with Twilio Client
    }
}