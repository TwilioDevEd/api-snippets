// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
var authToken = "your_auth_token";
var PricingClient = require('twilio').PricingClient;
var client = new PricingClient(accountSid, authToken);

client.phoneNumbers.countries.list(function(error, countries) {
    countries['countries'].forEach(function(c){
        console.log(c.isoCountry + "\n");
    });
});