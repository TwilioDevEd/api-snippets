if (self.client) {
    NSArray *invitees = @[@"bob", @"alice"];
    /* The createConversation method attempts to create and connect to a Conversation. 
    The 'localStatusChanged' delegate method can be used to track the success or failure
    of connecting to the newly created Conversation. */
    self.outgoingInvite = [self.client inviteManyToConversation:invitees 
                                                     localMedia:self.localMedia 
                                                        handler:[self acceptHandler]];
}