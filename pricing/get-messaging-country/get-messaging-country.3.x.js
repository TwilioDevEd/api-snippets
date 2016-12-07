// Download the Node helper library from twilio.com/docs/node/install
// These are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';

const PricingClient = require('twilio').PricingClient;
const client = new PricingClient(accountSid, authToken);

client.messaging.countries('EE').get((error, country) => {
    const cpList = country.inboundSmsPrices;
    for (let i = 0; i < cpList.length; i++) {
        console.log(cpList[i].numberType + ' ' + cpList[i].currentPrice);
    }
});
