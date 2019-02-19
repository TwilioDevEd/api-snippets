// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.sip.domains.create(
  {
    friendlyName: 'My Domain',
    voiceUrl: 'https://demo.twilio.com/welcome',
    authType: 'IP_ACL',
    domainName: 'marlo.sip.twilio.com',
  },
  (err, domain) => {
    process.stdout.write(domain.sid);
  }
);
