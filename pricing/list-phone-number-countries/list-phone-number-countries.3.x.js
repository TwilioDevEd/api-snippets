// Download the Node helper library from twilio.com/docs/node/install
// These are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';

const PricingClient = require('twilio').PricingClient;
const client = new PricingClient(accountSid, authToken);

client.phoneNumbers.countries.list((error, countries) => {
    countries['countries'].forEach((c) => {
        console.log(c.isoCountry);
    });
});
