// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.sip.domains('SD32a3c49700934481addd5ce1659f04d2')
  .ipAccessControlListMappings
  .each((ipAccessControlListMapping) => {
    console.log(ipAccessControlListMapping.friendlyName);
  });
