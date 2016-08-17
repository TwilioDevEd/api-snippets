- (IBAction)dialButtonPressed:(id)sender
{
    _connection = [_phone connect:nil delegate:nil];
}