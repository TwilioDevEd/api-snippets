// Download the Node helper library from twilio.com/docs/node/install
// These identifiers are your accountSid and authToken from
// twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const apiSecret = 'your_api_secret';
const client = require('twilio')(accountSid, apiSecret);

// Create a message for your account (send an outbound SMS)
client.messages.create({
    to: '+15558675309', // the destination phone number
    from: '+15017250604', // a Twilio number in your account
    body: 'Never gonna give you up.', // body of a text message
  })
  .then((messageData) => console.log(messageData.sid));
