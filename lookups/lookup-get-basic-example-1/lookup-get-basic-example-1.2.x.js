// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let LookupsClient = require('twilio').LookupsClient;
let client = new LookupsClient(accountSid, authToken);

client.phoneNumbers('+15108675309').get({
  type: 'carrier',
}, function(error, number) {
  console.log(number.carrier.type);
  console.log(number.carrier.name);
});
