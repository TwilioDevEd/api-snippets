if (self.client) {
    /* The createConversation method attempts to create and connect to a Conversation. 
    The 'localStatusChanged' delegate method can be used to track the success or failure
    of connecting to the newly created Conversation. */
    self.outgoingInvite = [self.client inviteToConversation:@"alice"
                                                 localMedia:self.localMedia 
                                                    handler:[self acceptHandler]];
}