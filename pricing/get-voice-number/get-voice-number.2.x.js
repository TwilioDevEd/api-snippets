// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
let accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
let authToken = 'your_auth_token';
let PricingClient = require('twilio').PricingClient;
let client = new PricingClient(accountSid, authToken);

client.voice.numbers('+15108675309').get(function(err, number) {
  console.log(number.outboundCallPrice.currentPrice);
});
