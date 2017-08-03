// Download the Node helper library from twilio.com/docs/node/install
// These vars are your accountSid and authToken from twilio.com/user/account
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client
  .connectApps('CNb989fdd207b04d16aee578018ef5fd93')
  .get((err, connectApp) => {
    console.log(connectApp.homepageUrl);
  });
