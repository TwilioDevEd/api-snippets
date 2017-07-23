// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.sip
  .domains('SD32a3c49700934481addd5ce1659f04d2')
  .ipAccessControlListMappings.create(
    {
      ipAccessControlListSid: 'AL95a47094615fe05b7c17e62a7877836c',
    },
    function(err, ipAccessControlListMapping) {
      process.stdout.write(ipAccessControlListMapping.sid);
    }
  );
