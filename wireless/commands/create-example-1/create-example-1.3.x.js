// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.preview.wireless.commands
  .create({
    command: 'wakeup',
    callbackUrl:
      'https://sim-manager.mycompany.com/commands/mobile-terminated-command-callback',
  })
  .then(response => {
    console.log(response);
  });
