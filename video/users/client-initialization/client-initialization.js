// Create an AccessManager to manage our Access Token
const accessManager = new Twilio.AccessManager('$TWILIO_ACCESS_TOKEN');

// Create a Conversations Client and connect to Twilio's backend
conversationsClient = new Twilio.Conversations.Client(accessManager);
conversationsClient.listen().then(
  function() {
    console.log('Connected to Twilio!');
  },
  function(error) {
    console.log('Could not connect to Twilio: ' + error.message);
  }
);
