// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let PricingClient = require('twilio').PricingClient;
let client = new PricingClient(accountSid, authToken);

client.voice.countries.list(function(error, response) {
  let cList = response.countries;
  for (let i = 0; i < cList.length; i++) {
    console.log(cList[i].isoCountry + '\n');
  }
});
