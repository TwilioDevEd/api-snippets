// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const PricingClient = require('twilio').PricingClient;
const client = new PricingClient(accountSid, authToken);

client.voice.numbers('+15108675310').get((err, number) => {
  console.log(number.outboundCallPrice.currentPrice);
});
