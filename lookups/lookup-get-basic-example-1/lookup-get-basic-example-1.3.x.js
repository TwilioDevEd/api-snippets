// Download the Node helper library from twilio.com/docs/node/install
// These are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';

const client = require('twilio')(accountSid, authToken);

client.lookups.v1
  .phoneNumbers('+15108675309')
  .fetch()
  .then(number => console.log(number.carrier.type, number.carrier.name));
