// Download the Node helper library from www.twilio.com/docs/libraries/node#installation
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

const credentialOpts = {
  friendlyName: 'MyFCMCredential',
  secret: 'fcm_secret',
  type: 'fcm',
};

client.notify
  .credentials.create(credentialOpts)
  .then(credential => console.log(credential.sid))
  .catch(error => console.log(error))
  .done()
