- (IBAction)hangupButtonPressed:(id)sender
{
    [_connection disconnect];
}