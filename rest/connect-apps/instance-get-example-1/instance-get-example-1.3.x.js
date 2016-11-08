// Download the Node helper library from twilio.com/docs/node/install
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client.connectApps('CNb989fdd207b04d16aee578018ef5fd93')
  .fetch()
  .then((connectApp) => console.log(connectApp.homepageUrl));
