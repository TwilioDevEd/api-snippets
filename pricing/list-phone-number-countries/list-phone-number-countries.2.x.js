// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const PricingClient = require('twilio').PricingClient;
const client = new PricingClient(accountSid, authToken);

client.phoneNumbers.countries.list(function(error, countries) {
  countries['countries'].forEach(function(c) {
    console.log(c.isoCountry + '\n');
  });
});
