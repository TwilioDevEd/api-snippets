// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const LookupsClient = require('twilio').LookupsClient;
const client = new LookupsClient(accountSid, authToken);

client.phoneNumbers('(510) 867-5310').get({
  countryCode: 'US',
  type: 'carrier',
}, (error, number) => {
  console.log(number.carrier.type);
  console.log(number.carrier.name);
});
