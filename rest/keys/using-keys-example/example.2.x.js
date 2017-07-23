// Download the Node helper library from twilio.com/docs/node/install
// Instantiate a client using your API key and secret - but then, you'll need to
// manually specify your main account (or subaccount) SID when making a request
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var apiKey = 'SKXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var apiSecret = 'your_api_secret';
var client = require('twilio')(apiKey, apiSecret);

// Create a reference to your Twilio account
var account = client.accounts(accountSid);

// Create a message for your account (send an outbound SMS)
account.messages.create(
  {
    to: '+15558675309', // the destination phone number
    from: '+15017250604', // a Twilio number in your account
    body: 'Never gonna give you up.', // body of a text message
  },
  (err, messageData) => {
    // print SID of the message you just sent
    console.log(messageData.sid);
  }
);
