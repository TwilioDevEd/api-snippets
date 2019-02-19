// NOTE: This example uses the next generation Twilio helper library - for more
// information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const apnCredentialSid = 'CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const fcmCredentialSid = 'CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const Twilio = require('twilio');

const client = new Twilio(accountSid, authToken);

client.notify.services
  .create({
    friendlyName: 'My Awesome Service',
    apnCredentialSid: apnCredentialSid,
    fcmCredentialSid: fcmCredentialSid,
  })
  .then(service => {
    console.log(service.friendlyName);
  })
  .catch(error => {
    console.log(error);
  })
  .done();
