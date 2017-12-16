// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const PricingClient = require('twilio').PricingClient;
const client = new PricingClient(accountSid, authToken);

client.voice.countries('EE').get((err, country) => {
  const cpList = country.inboundCallPrices;
  for (let i = 0; i < cpList.length; i++) {
    console.log(cpList[i].numberType + ' ' + cpList[i].currentPrice + '\n');
  }
});
