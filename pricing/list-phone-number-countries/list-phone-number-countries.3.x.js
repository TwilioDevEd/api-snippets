// Get your Account SID and Auth Token from twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';

// Get twilio-node from twilio.com/docs/libraries/node
const client = require('twilio')(accountSid, authToken).pricing;

client.phoneNumbers.countries.list()
  .then((countries) => {
    countries.forEach((country) => {
        console.log(country.isoCountry);
    });
  })
  .catch((error) => {
    console.log(error);
    throw error;
  });
