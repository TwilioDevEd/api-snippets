- (void)conversation:(TWCConversation *)conversation 
didConnectParticipant:(TWCParticipant *)participant {
    NSLog(@"Participant connected: %@", [participant identity]);
    participant.delegate = self;
}

- (void)conversation:(TWCConversation *)conversation 
didFailToConnectParticipant:(TWCParticipant *)participant error:(NSError *)error {
    NSLog(@"Participant failed to connect: %@ with error: %@", [participant identity], error);
}

- (void)conversation:(TWCConversation *)conversation 
didDisconnectParticipant:(TWCParticipant*)participant {
    NSLog(@"Participant disconnected: %@", [participant identity]);
}