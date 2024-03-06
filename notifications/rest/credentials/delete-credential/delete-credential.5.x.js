// Download the Node helper library from www.twilio.com/docs/libraries/node#installation
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

credentialSid = 'CRXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';

client.notify
  .credentials(credentialSid)
  .remove(wasRemoved => {
    if (wasRemoved) {
      console.log('Credential ' + credentialSid + ' was removed.');
    }
  })
  .done();
