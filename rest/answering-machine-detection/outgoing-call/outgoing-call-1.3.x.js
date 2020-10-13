// Download the Node helper library from twilio.com/docs/node/install
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

client.calls.create({
  to: '+1562300000',
  from: '+18180000000',
  machineDetection: 'Enable',
  url: 'https://handler.twilio.com/twiml/EH8ccdbd7f0b8fe34357da8ce87ebe5a16',
});
