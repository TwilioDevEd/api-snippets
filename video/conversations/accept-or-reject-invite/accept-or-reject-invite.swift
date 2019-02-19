/* Create an AccessManager - this provides a single place to update your Twilio
Access Token when using multiple Twilio SDKs */
var accessManager = TwilioAccessManager(token:self.accessToken, delegate:self)

// Create a Conversations Client and listen for IncomingInvites
var client = TwilioConversationsClient(accessManager: accessManager, delegate: self)
client!.listen()


// MARK: TwilioConversationsClientDelegate

// Selectively handle IncomingInvites based on the originator
func conversationsClient(conversationsClient: TwilioConversationsClient, 
                         didReceiveInvite invite: TWCIncomingInvite) {
    if (invite.from == "ringo") {
        invite.reject()
    } else {
        /* See the "Specify Local Media Constraints when Creating a
        Conversation" guide for instructions on constructing LocalMedia */
        invite.acceptWithLocalMedia(self.localMedia!) { conversation, error in
            self.conversation = conversation
            self.conversation!.delegate = self
        }
    }
}