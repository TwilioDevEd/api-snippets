// Create the general channel (for public use) if it hasn't been created yet
NSDictionary *options = @{
                         TCHChannelOptionFriendlyName: @"General Chat Channel",
                         TCHChannelOptionType: @(TCHChannelTypePublic)
                         };
[channels createChannelWithOptions:options completion:^(TCHResult *result, TCHChannel *channel) {
    if([result isSuccessful]) {
        NSLog(@"Channel created.");
    } else {
        NSLog(@"Channel NOT created.");
    }
}];