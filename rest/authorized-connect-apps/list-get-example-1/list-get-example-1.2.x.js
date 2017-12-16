// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.authorizedConnectApps.list((err, data) => {
  data.authorizedConnectApps.forEach(authorizedApp => {
    console.log(authorizedApp.connectAppHomepageUrl);
  });
});
