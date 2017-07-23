// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.sip
  .ipAccessControlLists('AL32a3c49700934481addd5ce1659f04d2')
  .ipAddresses.create(
    {
      friendlyName: 'My office IP Address',
      ipAddress: '55.102.123.124',
    },
    function(err, ipAddress) {
      process.stdout.write(ipAddress.sid);
    }
  );
