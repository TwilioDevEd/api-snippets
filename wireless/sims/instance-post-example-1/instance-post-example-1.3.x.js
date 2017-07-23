// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.preview.wireless
  .sims('DEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA')
  .update({
    callbackMethod: 'POST',
    callbackUrl:
      'https://sim-manager.mycompany.com/sim-update-callback/AliceSmithSmartMeter',
    status: 'active',
  })
  .then(function(response) {
    console.log(response);
  });
