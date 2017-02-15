// Download the Node helper library from www.twilio.com/docs/libraries/node#installation
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

const credentialOpts = {
  certificate: Certificate@cert.pem,
  privateKey: PrivateKey@key.pem,
  friendlyName: 'MyAPNCredential',
  sandbox: true,
  type: 'apn',
};

client.notify.v1
  .credentials.create(credentialOpts)
  .then(credential => console.log(credential.sid))
  .catch(error => console.log(error));
