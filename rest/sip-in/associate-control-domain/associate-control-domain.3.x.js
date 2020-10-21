// Download the Node helper library from twilio.com/docs/node/install
// These consts are your accountSid and authToken from https://www.twilio.com/console
// To set up environmental variables, see http://twil.io/secure
const accountSid = process.env.TWILIO_ACCOUNT_SID;
const authToken = process.env.TWILIO_AUTH_TOKEN;
const client = require('twilio')(accountSid, authToken);

client.sip
  .domains('SD32a3c49700934481addd5ce1659f04d2')
  .ipAccessControlListMappings.create({
    ipAccessControlListSid: 'AL32a3c49700934481addd5ce1659f04d2',
  })
  .then(ipAccessControlListMapping => {
    process.stdout.write(ipAccessControlListMapping.sid);
  });
