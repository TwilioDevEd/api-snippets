self.client = [TwilioIPMessagingClient ipMessagingClientWithToken:tokenResponse[@"token"]
                                                         delegate:self];