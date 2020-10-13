// Download the Node helper library from www.twilio.com/docs/libraries/node#installation
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

const credentialOpts = {
  certificate: 'Certificate@cert.pem',
  privateKey: 'PrivateKey@key.pem',
  friendlyName: 'MyAPNCredential',
  sandbox: 'true',
  type: 'apn',
};

client.notify.credentials
  .create(credentialOpts)
  .then(credential => console.log(credential.friendlyName))
  .catch(error => console.log(error))
  .done();
