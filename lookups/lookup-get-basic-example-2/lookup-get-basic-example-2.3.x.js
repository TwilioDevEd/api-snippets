// Download the Node helper library from twilio.com/docs/node/install
// These are your accountSid and authToken from https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;

const client = require('twilio')(accountSid, authToken);

client.lookups.v1
  .phoneNumbers('(510) 867-5310')
  .fetch({ countryCode: 'US', type: 'carrier' })
  .then(number => console.log(number.carrier.type, number.carrier.name));
