// Download the Node helper library from twilio.com/docs/node/install
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

client
  .authorizedConnectApps('CN47260e643654388faabe8aaa18ea6756')
  .fetch()
  .then(authorizedApp => console.log(authorizedApp.connectAppHomepageUrl));
