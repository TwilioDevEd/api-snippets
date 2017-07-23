/* Create an AccessManager - this provides a single place to update your 
Twilio Access Token when using multiple Twilio SDKs */
const accessManager = new Twilio.AccessManager('$TWILIO_ACCESS_TOKEN');

// Create a Conversations Client and listen for IncomingInvites
conversationsClient = new Twilio.Conversations.Client(accessManager);
conversationsClient.listen().then(
  () => {
    console.log('Connected to Twilio!');
    // Selectively handle IncomingInvites based on the originator
    client.on('invite', invite => {
      if (invite.from == 'ringo') {
        invite.reject();
      } else {
        invite.accept();
      }
    });
  },
  error => {
    console.log('Could not connect to Twilio: ' + error.message);
  }
);
