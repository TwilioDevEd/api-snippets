// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
var accountSid = '{{ account_sid }}';
var authToken = "{{ auth_token }}";
var PricingClient = require('twilio').PricingClient;
var client = new PricingClient(accountSid, authToken);

client.phoneNumbers.countries("US").get(function(err, country) {
	country.phoneNumberPrices.forEach(function(phonePrices){
        console.log(phonePrices.numberType + " " + phonePrices.currentPrice + "\n");
	}); 
});
