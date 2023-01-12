// Download the Node helper library from twilio.com/docs/library/node
// These are your Account Sid and Auth Token from https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;

const client = require('twilio')(accountSid, authToken);

client.lookups.v1
  .phoneNumbers('(510) 867-5310')
  .fetch({ countryCode: 'US' })
  .then(number => console.log(number.phoneNumber));
