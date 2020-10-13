// Download the Node helper library from twilio.com/docs/node/install
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const apiKey = process.env.TWILIO_API_KEY;;
const apiSecret = process.env.TWILIO_API_SECRET;
const client = require('twilio')(apiKey, apiSecret, { accountSid: accountSid });

// Create a message for your account (send an outbound SMS)
client.messages
  .create({
    to: '+15558675310', // the destination phone number
    from: '+15017122661', // a Twilio number in your account
    body: 'Never gonna give you up.', // body of a text message
  })
  .then(messageData => console.log(messageData.sid));
