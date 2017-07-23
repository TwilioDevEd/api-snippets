// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let PricingClient = require('twilio').PricingClient;
let client = new PricingClient(accountSid, authToken);

client.messaging.countries('EE').get(function(err, country) {
  let cpList = country.inboundSmsPrices;
  for (let i = 0; i < cpList.length; i++) {
    console.log(cpList[i].numberType + ' ' + cpList[i].currentPrice + '\n');
  }
});
