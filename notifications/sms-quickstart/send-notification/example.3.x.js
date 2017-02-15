// Download the Node helper library from www.twilio.com/docs/libraries/node#installation
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

const notificationOpts = {
  identity: '00000001', // We recommend using a GUID or other anonymized identifier for Identity.
  body: 'Knok-Knok! This is your first Notify SMS',
};

client.notify.v1
  .services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .notifications
  .create(notificationOpts)
  .then(notification => console.log(notification.sid))
  .catch(error => console.log(error));
