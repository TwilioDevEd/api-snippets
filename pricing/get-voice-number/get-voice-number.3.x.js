// Download the Node helper library from twilio.com/docs/node/install
// These are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';

const PricingClient = require('twilio').PricingClient;
const client = new PricingClient(accountSid, authToken);

client.voice.numbers('+15108675309').get((err, number) => {
    console.log(number.outboundCallPrice.currentPrice);
});
