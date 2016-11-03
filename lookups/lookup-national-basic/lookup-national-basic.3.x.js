// Download the Node helper library from twilio.com/docs/library/node
const LookupsClient = require('twilio').LookupsClient;

// These are your Account Sid and Auth Token from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';

const client = new LookupsClient(accountSid, authToken);

client.phoneNumbers('(510) 867-5309').get({
  countryCode: 'US',
}, function(error, number) {
  console.log(number.phoneNumber);
});
