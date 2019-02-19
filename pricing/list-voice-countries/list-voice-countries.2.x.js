// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const PricingClient = require('twilio').PricingClient;
const client = new PricingClient(accountSid, authToken);

client.voice.countries.list((error, response) => {
  const cList = response.countries;
  for (let i = 0; i < cList.length; i++) {
    console.log(cList[i].isoCountry + '\n');
  }
});
