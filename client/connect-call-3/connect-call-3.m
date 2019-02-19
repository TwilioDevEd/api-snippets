- (IBAction)dialButtonPressed:(id)sender
{
    NSDictionary *params = @{@"To": self.nameField.text};
    _connection = [_phone connect:params delegate:nil];
}