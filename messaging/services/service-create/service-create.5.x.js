// Download the Node helper library from twilio.com/docs/libraries/node
// These consts are your accountSid and authToken from https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;

const client = require('twilio')(accountSid, authToken);

const opts = {
  friendlyName: 'My First Service',
  statusCallback: 'http://requestb.in/1234abcd',
};

client.messaging.services
  .create(opts)
  .then(response => {
    console.log(response);
  })
  .catch(error => {
    console.log(error);
  });
