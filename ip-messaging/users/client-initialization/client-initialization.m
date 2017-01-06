self.client = [TwilioChatClient chatClientWithToken:tokenResponse[@"token"] 
                                         properties:nil 
                                           delegate:self];