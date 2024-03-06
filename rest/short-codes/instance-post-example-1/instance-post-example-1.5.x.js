// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

client
  .shortCodes('SC6b20cb705c1e8f00210049b20b70fce3')
  .update({ smsUrl: 'http://demo.twilio.com/docs/sms.xml' })
  .then(shortCode => console.log(shortCode.shortCode));
