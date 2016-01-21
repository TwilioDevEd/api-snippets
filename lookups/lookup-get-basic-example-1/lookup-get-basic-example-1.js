// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'AC3094732a3c49700934481addd5ce1659';
var authToken = '{{ auth_token }}';
var LookupsClient = require('twilio').LookupsClient;
var client = new LookupsClient(accountSid, authToken);

client.phoneNumbers('+15108675309').get(function(error, number) {
    console.log(number.carrier.name);
});
