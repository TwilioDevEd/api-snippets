// Download the Node helper library from twilio.com/docs/library/node
var LookupsClient = require('twilio').LookupsClient;

// These vars are your Account Sid and Auth Token from twilio.com/console
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'your_auth_token';
var client = new LookupsClient(accountSid, authToken);

client.phoneNumbers('(510) 867-5309').get({
  countryCode: 'US',
}, function(error, number) {
  console.log(number.phoneNumber);
});
