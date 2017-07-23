// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = 'your_auth_token';
var PricingClient = require('twilio').PricingClient;
var client = new PricingClient(accountSid, authToken);

client.messaging.countries.list(function(error, response) {
  var cList = response.countries;
  for (var i = 0; i < cList.length; i++) {
    console.log(cList[i].isoCountry + '\n');
  }
});
