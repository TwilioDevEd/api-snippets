// Download the Node helper library from twilio.com/docs/node/install
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

client.api.account.newKeys
  .create({
    friendlyName: 'User Joey',
  })
  .then(key => {
    process.stdout.write(key.sid);
    process.stdout.write(key.secret);
  });
