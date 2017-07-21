// Download the Node helper library from www.twilio.com/docs/libraries/node#installation
// These identifiers are your accountSid and authToken from
// https://www.twilio.com/console
const accountSid = 'ACXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX';
const authToken = 'your_auth_token';
const client = require('twilio')(accountSid, authToken);

const notificationOpts = {
  toBinding:{
    'binding_type':'sms',
    'address':'+1651000000000'
  },
  body: 'Knok-Knok! This is your first Notify SMS',
};

client.notify
  .services('ISXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX')
  .notifications
  .create(notificationOpts)
  .then(notification => console.log(notification.sid))
  .catch(error => console.log(error));
