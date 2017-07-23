// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let PricingClient = require('twilio').PricingClient;
let client = new PricingClient(accountSid, authToken);

client.phoneNumbers.countries('US').get(function(err, country) {
  country.phoneNumberPrices.forEach(function(phonePrices) {
    console.log(phonePrices.numberType + ' ' + phonePrices.currentPrice + '\n');
  });
});
