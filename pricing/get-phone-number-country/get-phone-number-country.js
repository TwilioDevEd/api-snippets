// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = 'AC3094732a3c49700934481addd5ce1659';
var authToken = "{{ auth_token }}";
var PricingClient = require('twilio').PricingClient;
var client = new PricingClient(accountSid, authToken);

client.phoneNumbers.countries("US").get(function(err, country) {
    for (var p in country.phoneNumberPrices) {
        console.log(p.numberType + " " + p.currentPrice + "\n");
    }
});
