- (IBAction)dialButtonPressed:(id)sender
{
    NSDictionary *params = @{@"To": self.numberField.text};
    _connection = [_phone connect:params delegate:nil];
}