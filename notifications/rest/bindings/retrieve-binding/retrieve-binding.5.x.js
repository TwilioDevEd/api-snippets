// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const Twilio = require('twilio');

const client = new Twilio(accountSid, authToken);

const service = client.notify.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service
  .bindings('BSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .fetch()
  .then(binding => {
    console.log(binding);
  })
  .catch(error => {
    console.log(error);
  })
  .done();
