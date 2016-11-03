// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';

let LookupsClient = require('twilio').LookupsClient;
let client = new LookupsClient(accountSid, authToken);

client.phoneNumbers('(510) 867-5309').get({
  countryCode: 'US',
  type: 'carrier',
}, function(error, number) {
  console.log(number.carrier.type);
  console.log(number.carrier.name);
});
