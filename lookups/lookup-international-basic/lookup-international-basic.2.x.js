// Download the Node helper library from twilio.com/docs/library/node
let LookupsClient = require('twilio').LookupsClient;

// These vars are your Account Sid and Auth Token from twilio.com/console
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let client = new LookupsClient(accountSid, authToken);

client.phoneNumbers('+4402077651182').get(function(error, number) {
  console.log(number.nationalFormat);
});
