// Create an AccessManager which can manage the expiration and lifecycle of
// the end user's connection to Twilio
var accessManager = new Twilio.AccessManager('token string');

// Create a Conversations Client and connect to Twilio's backend
conversationsClient = new Twilio.Conversations.Client(accessManager);
conversationsClient.listen().then(function() {
    console.log('Connected to Twilio!');
}, function (error) {
    console.log('Could not connect to Twilio: ' + error.message);
});
