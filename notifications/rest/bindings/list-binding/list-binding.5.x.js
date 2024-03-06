// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const Twilio = require('twilio');

const client = new Twilio(accountSid, authToken);

const service = client.notify.services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX');

service.bindings
  .list({
    // filter bindings with the following attributes
    startDate: new Date('2015-08-18'),
    tag: 'new user',
  })
  .then(bindings => {
    bindings.forEach(binding => console.log(binding.identity));
  })
  .catch(error => {
    console.log(error);
  })
  .done();
