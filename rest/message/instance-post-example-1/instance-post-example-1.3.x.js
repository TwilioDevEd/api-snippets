// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client
  .messages('MM800f449d0399ed014aae2bcc0cc2f2ec')
  .update({ body: '' })
  .then(message => process.stdout.write(message.body));
