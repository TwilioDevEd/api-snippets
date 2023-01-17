// Get your Account SID and Auth Token from twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;

// Get twilio-node from twilio.com/docs/libraries/node
const client = require('twilio')(accountSid, authToken).pricing;

client.phoneNumbers
  .countries('US')
  .fetch()
  .then(country => {
    country.phoneNumberPrices.forEach(price => {
      console.log(`${price.number_type} ${price.current_price}`);
    });
  })
  .catch(error => {
    console.log(error);
    throw error;
  });
