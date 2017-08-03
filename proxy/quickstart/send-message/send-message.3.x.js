// NOTE: This example uses the ALPHA release of the next generation Twilio
// helper library - for more information on how to download and install this version, visit
// https://www.twilio.com/docs/libraries/node#accessing-preview-twilio-features

// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';

const client = require('twilio')(accountSid, authToken);

client.preview.proxy
  .services('KSXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .sessions('KCXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .participants('KPXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .messageInteractions.create({
    body: 'Reply to this message to chat!',
  })
  .then(response => {
    console.log(response);
  })
  .catch(err => {
    console.log(err);
  });
